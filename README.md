# Causal-2-Pedagogy

This repository aims to organize all the materials and teaching resources for PH243A, Advanced Topics in Causal Inference. The main goal is to create a repository of resources for graduate student instructors (GSIs) that has version control such that as labs, simulations, and other resources change between GSIs there is a running history that can trace these changes. Overall, this repository aims to provide information that can be used by future GSIs to incrementally make PH243A use more of the teaching methods detailed in the book _Building Thinking Classrooms in Mathematics_. Because of the amount of material covered in the course it is difficult to use pedagogical methods other than simply reading directly from the labs and having students do problems individually. This readme gives an overview of each lab taught by the GSI and gives suggestions as to how each lab can be changed to encourage more thinking in the classroom, collective learning, discussions of equity and inclusions, and more engagement with notation.


# Lab 0

**Lab Restructuring** Historically this lab has been a R programming refresher. This can be useful for certain students who do not have R experience however it seems that what is more important is to instead have students work through this lab individually and use class time to review notation that is used in the class. This is particularly important to establish a foundation for all students to begin from. Experience teaching the course shows that midway into the course there is a division between students who can continue to understand more complicated estiamtors and those who get stuck. As such, this first lab time should be used to review a glossary of notation used in the _Targeted Learning_ books. For example, students have confusion around the difference between P_0 and P_{U,X} - that is, P_0 = Function(P_{U,X}, \bar{A}), so that you can think of the function as a one to many mapping and that P_0 is a coarsening of P_{U,X}. Or more simply, that P_0 is an instance of P_{U,X}. It is important to connect this point for students when simulating data using structural equations to create data generating systems. Students can think of the functions as P_{U,X} and an instance of these functions as P_0. It is important to connect this point to the notation. My suggestion for this section is to have students read the first three chapters of the _Causal Inference for Complex Longitudinal Studies_ starting with abbreviations and notation. When coming into the class have a worksheet prepared that simply has notation used in the class with no definition. Break students into groups and have them use the white board to define each notational principle, such as "Define P_0", of which the students would discuss together in their group and write on the white-board, "P_0" is th true data-generating distribution; 0~P_0. Additionally, it may help students connect these conceptual principles practically by asking for an example from simulations. Such as, "Define P_0" and "When we simulate a data-generating system, what is P_0 in this context?". A simple worksheet should be made with 15-20 of these questions. I suggest randomly spliting students into groups of 3-4 and giving each student space on the vertical white board to write out the notation and definitions. 
 
**Pedagogy principles**: Getting students together and engaged in a more transpaarent environment (vertical white board) avoids stalling and faking behavior. It also gets students to engage more actively with notation rather than passively reading it or writing it in Latex. The main goal of this first section is to create an activity that sets all students on the same path related to notation. The goal here is to establish a trajectory that will help students in the future be in a "Flow" or a state between frustration "activity is too hard for them" and "Boredom" activity is too easy for them. Anecdotally, I have found that students midway through the course do not know the fundamental notation and so the description of the estimators and questions related to writing out the notation of an estimator is too hard for them. Therefore, the idea of this first class to put everyone on the same page regarding notation. The reason why I think this should be the inaugural section is because most students are scared of notation and avoid it - they do not study it independently at home. Conversly, the original lab was on R programming basics which can easily be studied at home by students and is very accessible. Although R programming is necessary for the course, it is something that students tend to do independently until there is an error and therefore it makes more sense to have students do the original "Lab 0 - Programming Refresher" at home before the beginning of class. Reading the first 3 chapters (32 pages) and doing the programming refresher should not take students more than 4 hours. Overall, the principles aimed for in this restructuring are collaborative thinking and helping build a foundation for students that will increase the likelihood of being in a flow state later in the class.

**Goal**: Engage students with statistical notation used in the course in a more confident and active way. Get students to work with each other collaboratively to establish a notational foundation.

**To-do**: Write the worksheet that will be used for Lab 0. Write a simple R script for a random group generator that will be used in each class. 

**Visual Aids**: I have provided the jpegs for a GIF I created to help students understand /mathbb{M} - or the non-parametric statistical model and how P_0, P_{\epsilon}, and P_{U,X} are related to it. This I think is an important resource for students to think about what perturbs empirical data away from the true target parameter P_0 -that is, in the setting for the average treatmnt effect, because our counterfactuals are on A, the treatment, what pushes our parameter away from the true ATE is due to the propensity score (A|W). Here, it is important for students to see that, if we had a true randomized control trial, P_n and P_0 would be the same - it's the difference in likelihood for recieving treatment/exposure given covariates that moves us away from the true target estimand. Therefore, we can use estimation of this nuisance parameter to fluctuate our initial estimates in the direction of the truth. This visual should be used at the end of class to tie together the notational discussion students did and link that notation to targeted learning in the point-treatment setting. This is the first image in the GIF that wraps together the notation discussed into fluctuations of the system towards the ATE target parameter: 

![Non-Parametric Model and the ATE](https://github.com/blind-contours/Causal-2-Pedagogy/blob/main/Visuals/Lab_0/TMLE_roadmap.001.jpeg)





# Lab 1

**Lab Restructuring**:This lab focuses on simulating longitudinal data; there are two large improvements that can be made to this lab. The first is that the current example is an arbitrary research question that is not based on any real-world data. I find that, at the end of class many if not all students have questions about how to simulate a data-generating systems. This is because, the students are required to simuate data that immitates the functional forms they believe are present in their real-world data project. That is, students need to investigate how variables are associated, determine a temporal ordering, think about interactions in the data and once they have laid out the general structure, begin to program these as sets of equations to simulate from. Therefore, I believe this lab can be restructured to use a simple real-world data example in the beginning that will help students visualize the directed acyclic graph for longitudinal data and also teach them how to think about simualting data from actual data which will be needed at the end of the course. Similarly, I believe this is an excellent opportunity to engage students on how statistics can be used to investigate/estimate issues around social inequitities and how racism is a public health crisis. As such, I propose using existing data from [Center for the Study of Racism, Social Justice, and Health](https://www.racialhealthequity.org/data) as a representative data source that is more substantive and reflective of the current publich health environment in the U.S. (and in the world), rather than the current example which is a simple story of the amount of sleep students get each day before a statistics exam and the amount of sleep students get before a class where they report being sick or not. Although this will require some work in identifying a dataset that works for the class (has multiple $A$ nodes and time varying covariates $\bar{L}$, I think this task is worth the time because A. it will provide students with a real-world question that feels important - which will motivate students to actually want to create accurate estimators in the future (rather than the current dataset which feels boring), B. Using this dataset that feels more meaningful, it will teach students how to transfer real world data in to simulations (we can have students read the study description and variable meta data and they can, in groups, work out the DAGs that would represent the longitudinal data system), C. This knowledge would then help them directly in being able to simulate data based on their final projects of interest. Generally, I think this class should be restructured such that the first hour is 1. Showing this new dataset and describing why it's important, 2. getting students up and on the white board to think about the data-generating system and 3. writing out the functional forms more abstractly then in the second hour of class randomly split into pairs and do paired programming that actually simulates the exogenous and functional forms for the endogenous variables under various situations of censoring, and multiple outcomes. I also believe that the current lab data structures are a bit repetitive - ie. just increasing the number of timepoints or introducing censoring. I suggest using a real world data example that has both time varying covariates and censoring from the begining (more compicated system) and then discussing how simpler systems would just lack certain functional forms (we can just remove them).  

**Pedagogy principles**: The first part, using a real-world example that feels meaningful, is a way to get students more engaged with the actual research questions. These data-generating systems are used in almost every lab of the course so if it actually feels like we are answering a pertinent societal question, it will help motivate students to be active with the material. Likewise, getting students up and on the white-board together again to draw out the DAGs helps avoid students being passive and disengaged. This also helps the students develop skills in simulating data based on real data that is not currently taught but is needed for the final project. The second part, paired programming, is first done via visibly assigning random groups - the goal of this is to mobilize empathy, that is, because the groups are randomized if one student isn't as good at R programming as another, the more experienced will show more empathy in trying to help the person who is struggling more-so. Paired programming involves a navigator (that focuses on big-picture aspects of the task) and the driver (who is actually programming the immediate sets). This [video](https://www.youtube.com/watch?v=vgkahOzFH2Q) gives a nice breakdown (by kids!) of how to do paired programming. Why paired programming? I noticed that even when randomly assigning groups of 3-4 students to work on the labs together, invariably the students will just work on the labs together but independently (each person just programming) and they only engage when somebody has a bug/error in their code. By doing paired programming and having roles as navigator and driver, I think this will allow students to engage more with the material as a unit which helps with collaborative learning. 

**Goal**: To motivate students to care about a real-world data problem. Teach students how to simulate data from real world data. Engage students as a group in collaboratively thinking about data-generating systems. To use paired-programming to help students engage with programming together rather than individually. 

**To-do**: This will require re-writing a majority of this lab. We will need to 1. identify a new dataset that is longitudinal and addresses an issue related to racism and social justice from which a simulation can be created for and used during the rest of the class, 2. write sections to address this and give the story, 3. write sections to have students work in groups to draw out the system, and 4. retain most of what is currently in the lab, that is with simulating these new data-generating systems but with paired programing. Students can then submit the labs as their paired units, rather than individually.

**Visual Aids**: No visual aids for this section.
# Lab 2
**Lab Restructuring** This lab focuses on calculating true values of target causal parameters under longitudinal interventions. This lab builds off of the previous lab in that, now that functions have been made to simulate data, now the students are intervening on nodes (such simulating an outcome if all individuals were exposed/treated vs. not exposed/not treated). In the previous lab, we restructured the lab to use an actual real-world example related to social/health inequity and we gave thinking tasks to the students in how to simulate data from this before going into the actual simulated data provided. We formed visibly random groups for paired programming to establish a navigator and driver role in each group to keep students engaged and we used vertical surfaces as a class to write out the data-generating process for this real world data example. This lab can be re-written to follow our new data example but will remain mostly programming. In this lab it's important to connect that by simulating a large number of observations we are approximating P_{U,X}, that is, we are drawing observations from all the different combinations of values from the joint distribution shown in the Lab 0 figure. Because this lab is all programming, intervening on the previously made functions and interpreting results, I believe again that visually random paired groups for paired programming will keep students engaged. Currently, the GSI introduces the lab, students understand the goals, and even when put into groups of three to four, end up working silently together. To establish more engagement, I think the room should be structured to have smaller tables so that each pair group can sit together and feel like they can discuss the problems (navigator) and the driven can talk through what is being programmed, without distracting other groups, or at least to make the pairs feel more comfortable communicating. This defronts the classroom. This lab is generally pretty easy for those that are skilled in programming but harder of course for those that are not as familiar. In the beginning of this lab then it is important to stress that in the paired programming, the goal of the lab is also to create an environment for students who are skilled to learn how to teach programming as well. Generally students have more questions around the marginal structural models so I would designate more time around that given this approach is used later in the course for most final projects because most students have many time points and need to summarize results into some easily interpretable measure that also has more power by borrowing information across the treatment regimes. Overall, this lab will continue to focus on intervening on the data-generating systems but now these systems are based on a different example and we are using paired programming from random group assignment. It is more difficult to answer only thinking questions in these labs because most questions are about programming problems. The GSI could ask the rest of the class if others have had X problem and how they solved it but I would use this method with disgression as it distracts all the other groups. It is better for the GSI to work with the pair but instead of answering directly, to ask "What would you Google to answer this question", or "What is it you are trying to do and where do you think the problem is?".
 
**Pedagogy principles**:Team based collaborative programing. Defronting the classroom. Consolidating from the bottom - if our goal is to have students fluently program these estimators then the class works at a pace balanced by those who are less advanced in programing because when they are drivers the navigator will help them - of course this slows things down but will hopefully push the students who are less skilled in R to practice outside of class so that the dynamic they have feels more productive when working with a team member. 


**Goal:** To teach students who are more skilled in programming how to help others. To facilitate more empathy and help when programming together rather than default into the silent individual programming that invariably happens in these labs that are more heavely just coding in R. To help students collaborate in solving programming problems related to the statistical questions of interest. 

**To-do**: The lab will need to be re-written to use the more socially inspired real-world example but most of the programming/functions will remain the same. Will need to create an R script for random paired programming assigner with navigator/driver. Could also make a timer such that when it goes off the navigator/driver in each group swiches. 

# Lab 3

**Lab Restructuring** This lab focuses on understanding time dependent confounding and identifiability in longitudinal context - this goal is done in such a way that the standard randomization and positivity assumptions used in the point treatment setting do not hold so we set up a numer of straw man situations to show that there is no set of confounders that we can adjust for simultaneously that block the backdoor path and are not descendents of our treatment nodes. As such, it is important for students to have a firm understanding of the randomization assumption in the point treatment setting. Originally, examples were given by the lecturer of the class but I believe these examples should be moved to the lab (with additional examples) such that students can engage with the content more actively. For example, students are normally given directed acyclic graphs and asked if there are any set of variables that can be adjusted for that isolate the causal path of interest. However, I think that students would engage more if they were in fact given situations where they had to draw from a description. For example, "Draw a directed acyclic graph with three endogenous nodes and two exogenous nodes where the null set is true (no adjustment necessary)". This type of question forces students to think more deeply about these causal graphs rather than simply saying yes or no to the question, "can we isolated the causal path of interest?". This type of teaching will take more time - as such, I recommend splitting this lab in two for two different lab sections. It's particularly important to slow down in this section as the beginning of the lab was introduction to non-parametric statistics in the longitudinal setting and the associated R coding but now we are getting into new statistical principles related to the sequential randomization and positivitiy assumptions which students have not seen in the Causal 1 class. Because of the new concepts introduced in this lab, I think the first hour of lecture can be used to introduce the sequential randomization/positivity assumptions in the longitudinal setting for a simple example - this way students are familiarized with how this is different to the point treatment setting. Then in the second hour students are randomized to groups of 4 and each group works on the board to answer questions like "Write out the randomization assumption for a study with four treatments, four time varying covariates, baseline covariates, and a final outcome measured at the end". This flips the material so instead of just showing the students the equations they are instead given a situation which they need to translate into mathematical terms. The same can be done for the target causal parameters. This lab would need to be re-written to both change the way this material is presented and also to do so with the new causal question in mind related to the new dataset presented in Lab 1. Generally the goal here is to make students think more about what variables are being intervened on and how this changes the sequential randomization equations. Because of flipping the way this is taught, I think it may be more helpful in getting students to have more intuition around these, what seems on the surface, very convoluted equations that are hard to break down. 

**Pedagogy principles**: Get students engaged with new statistical equations by getting them up on the white-board in groups. This helps students take a simple example for a target estimate and expand on it in a lighter more dynamic setting (erasable white board) rather than trying to write it in Latex which is more laborious. The idea is to try and get students to feel like they can play with notation in the same way that they program - through a bit of trial and error. As of now, these new concepts are basically presented to the students which leads to a passive acceptance. Also this leads to consolidation from the bottom because students can work together to draw out the data structures and answer these questions so it ensures that all students are collaborating with the new information - 
consolidating from the bottom. 

**Goal**: To get students more engaged with new statistical concepts and equations. To make students feel more confident with this material.

**To-do**: The lab will need to be re-written to use the more socially inspired real-world example. This should be done to keep the various statistical parameter/structures the same. That is, having more important examples for real-world situations but keeping the number of treatments/time-varying covariates/outcomes the same. 

**Visual Aids**: For this lab, I think that students should use the white board to draw data structures similar to these examples 
![DAG examples](https://github.com/blind-contours/Causal-2-Pedagogy/blob/main/Visuals/Lab_3/DAG_examples.png)

# Lab 4
**Lab Restructuring**: At this point in the lab students should be comfortable with the background material needed in previous steps of the roadmap before estimation. This means that, to really transfer learning to the individual level, students need to begin taking on more responsibility for their own learning. In the previous labs, there was not much work needed by students to be done before the lab, besides Lab 0. Now however, we should begin priming students to come in with some background as to what will be covered. In this case, the current lab is the inverse probability of treatment weighted estimator, how it is equivalent to the g-computation estimator, and the various performance measures for estimators. Again, rather than just presenting students with the equations in the PDF and having them program - we should begin by handing students a lab principles worksheet, randomly splitting into groups, and having students work on the white board to answer questions such as "Write out the equation for MSE based on bias and variance of an estimator" and "Write out the IPTW estimator for two treatment time points under no censoring" and "Draw a histogram of propensity weights that are indicative of positivity violations for the IPTW estimator". This particular strategy at the beginning of each class - the lab principles worksheet that is done by groups on the whiteboard- is particular important for the consolidation from the bottom which must start with the presentation of solutions that all students got to. In this way, before entering into coding of the estimators, everyone is starting from the same place. The strategy of teaching the whole class then becomes a scenario where the GSI leads a detailed discussion of the tasks and
solutions using student work on the whiteboard to work through the different layers of the solution. Then, with those solutions, the class then can then work into applying the estimators to the real world data simulation and to assessing the bias/variance/MSE of the estimator under resampling. 

**Pedagogy principles**: Active engagement by using the white board in randomly assigned groups. Putting responsibility on the students for their own learning a little more. Consolidation from the bottom. Because of the structure of the class, what students wrote on the white board now become their own meaningful notes for the subsequent section of implementing/programing the estimators. Students are used to being told exactly what to write down in their notes, or in our case, exactly what to write in the solutions/programming. Restructuring the classroom to start with group work of the lab principles worksheet allows students to simultaneously think actively in solutions which then become the meaningful notes for the next sections when they are programming.

**Goal**: Consolidation from the bottom, meaningful notes, managing flow by creating worksheets that are incrementally harder. 

**To-do**: Lab principles worksheets will need to be made. All the equations and programming can be retained in the current lab 4 but the general problem to be answer will need to be reflected in the new real world example. 


# Lab 5

**Lab Restructuring**: This lab focuses on using the LTMLE package for longitudinal target learning. 

**Pedagogy principles**:

**Goal**: 

**To-do**: 

# Lab 6


**Lab Restructuring**:

**Pedagogy principles**:

**Goal**: 

**To-do**: 

# Lab 7

**Lab Restructuring**:

**Pedagogy principles**:

**Goal**: 

**To-do**: 

