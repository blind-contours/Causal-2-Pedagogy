students <- c("Adam Bouyamourn",
              "Jessica Briggs",
              "Caitlin Chan", 
              "Pablo Freyria Duenas",
              "Pooja Iyer",
              "Jonathan Izudi",
              "Mulusew Jebena", 
              "Nerissa Nance",
              "Emily Rosenthal", 
              "Robert Schell", 
              "Seraphina Shi",
              "Keniel Yao",
              "Ynzhe Zhou")

sample(students, size = length(students), replace = FALSE, prob = rep(1/13, 13))

split(students, replicate(13, sample(1:5, 1)))