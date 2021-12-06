# Causal-2-Pedagogy

This repository aims to organize all the materials and teaching resources for PH243A, Advanced Topics in Causal Inference. The main goal is to create a repository of resources for graduate student instructors (GSIs) that has version control such that as labs, simulations, and other resources change between GSIs there is a running history that can trace these changes. Overall, this repository aims to provide information that can be used by future GSIs to incrementally make PH243A use more of the teaching methods detailed in the book _Building Thinking Classrooms in Mathematics_. Because of the amount of material covered in the course it is difficult to use pedagogical methods other than simply reading directly from the labs and having students do problems individually. This readme gives an overview of each lab taught by the GSI and gives suggestions as to how each lab can be changed to encourage more thinking in the classroom, collective learning, discussions of equity and inclusions, and more engagement with notation.


# Lab 0

Historically this lab has been a R programming refresher. This can be useful for certain students who do not have R experience however it seems that what is more important is to instead have students work through this lab individually and use class time to review notation that is used in the class. This is particularly important to establish a foundation for all students to begin from. Experience teaching the course shows that midway into the course there is a division between students who can continue to understand more complicated estiamtors and those who get stuck. As such, this first lab time should be used to review a glossary of notation used in the _Targeted Learning_ books. For example, students have confusion around the difference between P_0 and P_{U,X} - that is, P_0 = Function(P_{U,X}, \bar{A}), so that you can think of the function as a one to many mapping and that P_0 is a coarsening of P_{U,X}. Or more simply, that P_0 is an instance of P_{U,X}. It is important to connect this point for students when simulating data using structural equations to create data generating systems. Students can think of the functions as P_{U,X} and an instance of these functions as P_0. It is important to connect this point to the notation. My suggestion for this section is to have students read the first three chapters of the _Causal Inference for Complex Longitudinal Studies_ starting with abbreviations and notation. When coming into the class have a worksheet prepared that simply has notation used in the class with no definition. Break students into groups and have them use the white board to define each notational principle, such as "Define P_0", of which the students would discuss together in their group and write on the white-board, "P_0" is th true data-generating distribution; 0~P_0. Additionally, it may help students connect these conceptual principles practically by asking for an example from simulations. Such as, "Define P_0" and "When we simulate a data-generating system, what is P_0 in this context?". A simple worksheet should be made with 15-20 of these questions. I suggest randomly spliting students into groups of 3-4 and giving each student space on the vertical white board to write out the notation and definitions. 
 
Pedagogy principles: Getting students together and engaged in a more transpaarent environment (vertical white board) avoids stalling and faking behavior. It also gets students to engage more actively with notation rather than passively reading it or writing it in Latex. The main goal of this first section is to create an activity that sets all students on the same path related to notation. The goal here is to establish a trajectory that will help students in the future be in a "Flow" or a state between frustration "activity is too hard for them" and "Boredom" activity is too easy for them. Anecdotally, I have found that students midway through the course do not know the fundamental notation and so the description of the estimators and questions related to writing out the notation of an estimator is too hard for them. Therefore, the idea of this first class to put everyone on the same page regarding notation. The reason why I think this should be the inaugural section is because most students are scared of notation and avoid it - they do not study it independently at home. Conversly, the original lab was on R programming basics which can easily be studied at home by students and is very accessible. Although R programming is necessary for the course, it is something that students tend to do independently until there is an error and therefore it makes more sense to have students do the original "Lab 0 - Programming Refresher" at home before the beginning of class. Reading the first 3 chapters (32 pages) and doing the programming refresher should not take students more than 4 hours. Overall, the principles aimed for in this restructuring are collaborative thinking and helping build a foundation for students that will increase the likelihood of being in a flow state later in the class.

Goal: Engage students with statistical notation used in the course in a more confident and active way. Get students to work with each other collaboratively to establish a notational foundation.

To-do: Write the worksheet that will be used for Lab 0. Write a simple R script for a random group generator that will be used in each class. 

Visual Aids: I have provided the jpegs for a GIF I created to help students understand /mathbb{M} - or the non-parametric statistical model and how P_0, P_{\epsilon}, and P_{U,X} are related to it. This I think is an important resource for students to think about what perturbs empirical data away from the true target parameter P_0 -that is, in the setting for the average treatmnt effect, because our counterfactuals are on A, the treatment, what pushes our parameter away from the true ATE is due to the propensity score (A|W). Here, it is important for students to see that, if we had a true randomized control trial, P_n and P_0 would be the same - it's the difference in likelihood for recieving treatment/exposure given covariates that moves us away from the true target estimand. Therefore, we can use estimation of this nuisance parameter to fluctuate our initial estimates in the direction of the truth. This visual should be used at the end of class to tie together the notational discussion students did and link that notation to targeted learning in the point-treatment setting. 



# Lab 1

This lab focuses on simulating longitudinal data; there are two large improvements that can be made to this lab. The first is that the current example is an arbitrary research question that is not based on any real-world data. I find that, at the end of class many if not all students have questions about how to simulate a data-generating systems. This is because, the students are required to simuate data that immitates the functional forms they believe are present in their real-world data project. That is, students need to investigate how variables are associated, determine a temporal ordering, think about interactions in the data and once they have laid out the general structure, begin to program these as sets of equations to simulate from. Therefore, I believe this lab can be restructured to use a simple real-world data example in the beginning that will help students visualize the directed acyclic graph for longitudinal data and also teach them how to think about simualting data from actual data which will be needed at the end of the course. Similarly, I believe this is an excellent opportunity to engage students on how statistics can be used to investigate/estimate issues around social inequitities and how racism is a public health crisis. As such, I propose using existing data from [Center for the Study of Racism, Social Justice, and Health](https://www.racialhealthequity.org/data) as a representative data source that is more substantive and reflective of the current publich health environment in the U.S. (and in the world), rather than the current example which is a simple story of the amount of sleep students get each day before a statistics exam and the amount of sleep students get before a class where they report being sick or not. Although this will require some work in identifying a dataset that works for the class (has multiple $A$ nodes and time varying covariates $\bar{L}$, I think this task is worth the time because A. it will provide students with a real-world question that feels important - which will motivate students to actually want to create accurate estimators in the future (rather than the current dataset which feels boring), B. Using this dataset that feels more meaningful, it will teach students how to transfer real world data in to simulations (we can have students read the study description and variable meta data and they can, in groups, work out the DAGs that would represent the longitudinal data system), C. This knowledge would then help them directly in being able to simulate data based on their final projects of interest. Generally, I think this class should be restructured such that the first hour is 1. Showing this new dataset and describing why it's important, 2. getting students up and on the white board to think about the data-generating system and 3. writing out the functional forms more abstractly then in the second hour of class randomly split into pairs and do paired programming that actually simulates the exogenous and functional forms for the endogenous variables under various situations of censoring, and multiple outcomes. I also believe that the current lab data structures are a bit repetitive - ie. just increasing the number of timepoints or introducing censoring. I suggest using a real world data example that has both time varying covariates and censoring from the begining (more compicated system) and then discussing how simpler systems would just lack certain functional forms (we can just remove them).  

Pedagogy principles: The first part, using a real-world example that feels meaningful, is a way to get students more engaged with the actual research questions. These data-generating systems are used in almost every lab of the course so if it actually feels like we are answering a pertinent societal question, it will help motivate students to be active with the material. Likewise, getting students up and on the white-board together again to draw out the DAGs helps avoid students being passive and disengaged. This also helps the students develop skills in simulating data based on real data that is not currently taught but is needed for the final project. The second part, paired programming, is first done via visibly assigning random groups - the goal of this is to mobilize empathy, that is, because the groups are randomized if one student isn't as good at R programming as another, the more experienced will show more empathy in trying to help the person who is struggling more-so. Paired programming involves a navigator (that focuses on big-picture aspects of the task) and the driver (who is actually programming the immediate sets). This [video](https://www.youtube.com/watch?v=vgkahOzFH2Q) gives a nice breakdown (by kids!) of how to do paired programming. Why paired programming? I noticed that even when randomly assigning groups of 3-4 students to work on the labs together, invariably the students will just work on the labs together but independently (each person just programming) and they only engage when somebody has a bug/error in their code. By doing paired programming and having roles as navigator and driver, I think this will allow students to engage more with the material as a unit which helps with collaborative learning. 

Goal: 

To-do: 

Visual Aids: 
# Lab 2



Goal: 

To-do: 

# Lab 3



Goal: 

To-do: 

# Lab 4


Goal: 

To-do: 


# Lab 5


Goal: 

To-do: 

# Lab 6


Goal: 

To-do: 

# Lab 7

Goal: 

To-do: 

