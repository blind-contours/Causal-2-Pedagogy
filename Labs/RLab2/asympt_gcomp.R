# packages
library(here)
library(tidyverse)
library(wesanderson)
library(future)
library(future.apply)

# general options
options(scipen = 999)
set.seed(288116)

# plotting + parallelization
plan(multisession)
pd <- position_dodge(0.2)
pal <- wes_palette("Darjeeling1")

# simulation settings
n_sim <- 1000
n_samp <- cumsum(rep(sqrt(100), 5))^2
alpha_level <- 0.05
true_coef_A <- 0.3

# run sequentially over sample size grid
all_sims <- lapply(n_samp, function(n_obs) {
  # run in parallel over number of iterations
  sim_results <- future_lapply(seq_len(n_sim), function(iter) {
    # generate data (NOTE: no effect of A on Y)
    W1 <- runif(n_obs)
    W2 <- runif(n_obs)
    A <- rbinom(n_obs, 1, 0.5)
    Y <- pnorm(true_coef_A * A + rnorm(n_obs, 0, 0.1))
    Y <- rbinom(n_obs, 1, prob = Y)
    dat <- as_tibble(list(Y = Y, A = A, W1 = W1, W2 = W2))
    
    dat %>%
      group_by(A) %>%
      summarise_at(vars(Y), list(name = mean))

    # fit misspecified GLM and GLM with all interactions
    A_glm <- glm(Y ~ A, data = dat, family = binomial)
    w1_glm <- glm(Y ~ A + W1, data = dat, family = binomial)
    w12_glm <- glm(Y ~ A + W1 + W2, data = dat, family = binomial)
    
    A_glm_lm <- glm(Y ~ A, data = dat)
    w1_glm_lm <- glm(Y ~ A + W1, data = dat)
    w12_glm_lm <- glm(Y ~ A + W1 + W2, data = dat)
    
    dat1 <- dat0 <- dat
    dat1$A <- 1
    dat0$A <- 0
    
    gcomp_A <- mean(predict(A_glm, newdata = subset(dat1, select = -Y)) - predict(A_glm, newdata = subset(dat0, select = -Y)))
    gcomp_w1 <- mean(predict(w1_glm, newdata = subset(dat1, select = -Y)) - predict(w1_glm, newdata = subset(dat0, select = -Y)))
    gcomp_w2 <- mean(predict(w12_glm, newdata = subset(dat1, select = -Y)) - predict(w12_glm, newdata = subset(dat0, select = -Y)))
    
    # get p-values for Wald-style test of the coefficient of A
    pval_A_glm <- summary(A_glm)[["coefficients"]][2, 4]
    pval_w1_glm <- summary(w1_glm)[["coefficients"]][2, 4]
    pval_w12_glm <- summary(w12_glm)[["coefficients"]][2, 4]
    pvals <- c(pval_A_glm, pval_w1_glm, pval_w12_glm)

    # create CIs for the coefficient of A and check coverage
    ci_A_glm <- suppressMessages(confint(A_glm)[2, ])
    covers_A_glm <- between(true_coef_A, ci_A_glm[1], ci_A_glm[2])
    
    ci_w1_glm <- suppressMessages(confint(w1_glm)[2, ])
    covers_w1_glm <- between(true_coef_A, ci_w1_glm[1], ci_w1_glm[2])
    
    ci_w12_glm <- suppressMessages(confint(w12_glm)[2, ])
    covers_w12_glm <- between(true_coef_A, ci_w12_glm[1], ci_w12_glm[2])
    
    coverage <- c(covers_A_glm, covers_w1_glm, covers_w12_glm)

    # created combined tibble of coverage and p-values
    results <- tibble(pvals = pvals, 
                      cov = coverage, 
                      type = c("y ~ A", "y ~ A + W1", "y ~ A + W1 + W2"),
                      glm_ests = c(coef(A_glm)[2], coef(w1_glm)[2], coef(w12_glm)[2]),
                      gcom_ests = c(gcomp_A, gcomp_w1, gcomp_w2))
    return(results)
  }, future.seed = TRUE)

  # summarize results across simulations
  sim_results_summary <- bind_rows(sim_results, .id = "iter") %>%
    group_by(type) %>%
    summarize(
      error_rate = mean(pvals <= alpha_level),
      coverage_rate = mean(cov),
      beta_esimates = mean(glm_ests),
      gcomp_esimates = mean(gcom_ests)
    )
  return(sim_results_summary)
}) %>% set_names(n_samp)

# clean up simulation results
all_sims_summary <- bind_rows(all_sims, .id = "n_samp") %>%
  mutate(
    n_samp = as.numeric(n_samp)
    # type = case_when(type == "bad" ~ "Misspecified",
    #                  type == "good" ~ "Correctly Specified")
  )

# plot of Type-I error rate
p_err <- all_sims_summary %>%
  ggplot(aes(x = as.factor(n_samp), y = error_rate,
             group = type, shape = type, fill = type)) +
  geom_point(size = 10, alpha = 0.75, position = pd) +
  geom_line(linetype = "dotted", position = pd) +
  geom_hline(yintercept = 0.05, linetype = "dashed") +
  theme_bw() +
  theme(legend.position = c(0.88, 0.66),
        legend.background = element_rect(fill = "gray90", size = 0.25,
                                         linetype = "dotted"),
        legend.text = element_text(size = 44),
        legend.title = element_blank(),
        text = element_text(size = 40),
        axis.text.x = element_text(colour = "black", size = 30),
        axis.text.y = element_text(colour = "black", size = 30)) +
  guides(color = guide_legend(title = NULL)) +
  labs(x = "Sample size",
       y = "Error rate of hypothesis tests at 5% level",
       title = "Type-I Error of Correctly Specified v. Misspecified Estimators",
       subtitle = "(aggregated across 1000 simulation experiments)"
      ) +
  scale_shape_manual(values = c(22, 25, 12, 13, 23, 24)) +
  scale_fill_manual(values = pal)

# plot of confidence interval coverage
p_cov <- all_sims_summary %>%
  ggplot(aes(x = as.factor(n_samp), y = coverage_rate,
             group = type, shape = type, fill = type)) +
  geom_point(size = 10, alpha = 0.75, position = pd) +
  geom_line(linetype = "dotted", position = pd) +
  geom_hline(yintercept = 0.95, linetype = "dashed") +
  theme_bw() +
  theme(legend.position = c(0.88, 0.68),
        legend.background = element_rect(fill = "gray90", size = 0.25,
                                         linetype = "dotted"),
        legend.text = element_text(size = 44),
        legend.title = element_blank(),
        text = element_text(size = 40),
        axis.text.x = element_text(colour = "black", size = 30),
        axis.text.y = element_text(colour = "black", size = 30)) +
  guides(color = guide_legend(title = NULL)) +
  labs(x = "Sample size",
       y = "95% confidence interval coverage",
       title = "Coverage of Correctly Specified v. Misspecified Estimators",
       subtitle = "(aggregated across 1000 simulation experiments)"
      ) +
  scale_shape_manual(values = c(22, 25, 12, 13, 23, 24)) +
  scale_fill_manual(values = pal)

beta_ests <- all_sims_summary %>%
  ggplot(aes(x = as.factor(n_samp), y = beta_esimates,
             group = type, shape = type, fill = type)) +
  geom_point(size = 10, alpha = 0.75, position = pd) +
  geom_line(linetype = "dotted", position = pd) +
  geom_hline(yintercept = 0.95, linetype = "dashed") +
  theme_bw() +
  ylim(0, 0.8) +
  theme(legend.position = c(0.78, 0.38),
        legend.background = element_rect(fill = "gray90", size = 0.25,
                                         linetype = "dotted"),
        legend.text = element_text(size = 44),
        legend.title = element_blank(),
        text = element_text(size = 40),
        axis.text.x = element_text(colour = "black", size = 30),
        axis.text.y = element_text(colour = "black", size = 30)) +
  guides(color = guide_legend(title = NULL)) +
  labs(x = "Sample size",
       y = "95% confidence interval coverage",
       title = "Coverage of Correctly Specified v. Misspecified Estimators",
       subtitle = "(aggregated across 1000 simulation experiments)"
  ) +
  scale_shape_manual(values = c(22, 25, 12, 13, 23, 24)) +
  scale_fill_manual(values = pal)

gcomp_ests <- all_sims_summary %>%
  ggplot(aes(x = as.factor(n_samp), y = gcomp_esimates,
             group = type, shape = type, fill = type)) +
  geom_point(size = 10, alpha = 0.75, position = pd) +
  geom_line(linetype = "dotted", position = pd) +
  geom_hline(yintercept = 0.95, linetype = "dashed") +
  theme_bw() +
  ylim(0, 0.8) +
  theme(legend.position = c(0.78, 0.38),
        legend.background = element_rect(fill = "gray90", size = 0.25,
                                         linetype = "dotted"),
        legend.text = element_text(size = 44),
        legend.title = element_blank(),
        text = element_text(size = 40),
        axis.text.x = element_text(colour = "black", size = 30),
        axis.text.y = element_text(colour = "black", size = 30)) +
  guides(color = guide_legend(title = NULL)) +
  labs(x = "Sample size",
       y = "95% confidence interval coverage",
       title = "Coverage of Correctly Specified v. Misspecified Estimators",
       subtitle = "(aggregated across 1000 simulation experiments)"
  ) +
  scale_shape_manual(values = c(22, 25, 12, 13, 23, 24)) +
  scale_fill_manual(values = pal)

# save plots
ggsave(filename = here("error_turing.pdf"),
       plot = p_err, width = 28, height = 18)
ggsave(filename = here("coverage_turing.pdf"),
       plot = p_cov, width = 28, height = 18)
