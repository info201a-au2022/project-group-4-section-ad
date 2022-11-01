# Gym Crowdiness: Project Proposal

### Authors
This paper is written by Justin Dong, David Phan, and Sarthak Karmakar

### Affiliation
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

### Date
Autumn 2022

### Abstract
Our main question is how do external factors affect people's willingness to go to the gym. This question is important because in order to make gym-going easier, we want to provide newcomers times to go to the gym when crowdiness is at its least. To address this question, we will perform an analysis on teamperature, weather, seasons, time, and their relationship on gym crowdiness. 

### Keywords
Gym, fitness, foot traffic 

### Introduction
The Intramural Activities building (IMA)  is one of many great resources offered to students attending the University of Washington. Although the IMA is free, many students still do not take full advantage of the facility due to the intimidating environment that surrounds the building. Our goal with this project is to make going to the IMA easier for students who are looking to start working out. We plan to primarily address this issue by analyzing a [dataset](https://www.kaggle.com/datasets/nsrose7224/crowdedness-at-the-campus-gym?datasetId=527) that tracks crowdiness at a campus gym. 

In order to effectively provide students a comprehensive idea of when good times to go to the gym are, we’ll pull data of crowdiness at different times by weekday, with exceptions on holidays. Seeing as how the University gym (Brekeley) in the dataset is of a very similar size, crowdedness is assumed to be similar in number. Additional segmentations for the dataset includes weather, seasons, and temperature. All of this data will be analyzed and provided to students to find a good time to go to the gym when crowdiness is at it’s minimum. 

### Problem Domain

### Research Questions
**Is there a relationship between day of the week and gym crowdiness?**
Each day comes with different commitments - people may be busy with class and commitments one day, but have nothing on the weekends. We want to see whether there are big differences in the amount of people there during the weekend compared to the number of people there on a weekday and single-out days with the least traffic.

**How does rainy weather affect people’s willingness to go to the gym?**
Weather condition is an important factor when people decide to go outside or not, and going to the IMA is no exception. We want to see if there is a connection between harsh weather and gym attendance with the goal of calculating an average change metric when it is raining. 

**Do weekends and holidays affect gym traffic?**
Holidays and seasons may have an effect on gym attendance - an example of this would be a spike in gym traffic following New Year or a dip in gym traffic during Thanksgiving break. We want to find out whether holidays affect gym attendance and on an even broader scale, whether different seasons have varying attendance levels. 

### The Dataset
The first dataset we have is from UC Berkeley relating to their gym crowding during the school year. The dataset includes things like temperature, day of week, and points in the school year. Since the focus of our project is to make it as easy for people to go to the gym, this dataset can help us find when the gym is less busy so it is less intimidating and easier to navigate. The second dataset is about a college age friend group about when they went to the gym. It includes how often they went to the gym and motivations around them. As these are college students going to the gym, they can contribute to the data from the first dataset. The third dataset is similar to the first one where it includes timestamps for when people worked out and how packed the gym was at that point. This can also contribute to the data from the first dataset because it shows exactly how packed the gym was at each time. 

| Name of File  | Crowdedness at Campus Gym | Fitness Analysis | University of Ottawa Workout Session Demand |
| --------------------------------| --------|---------|------|
| Number of Observations | 62185 | 546 | 404339 |
| Number of Variables| 11  | 8 | 7 |

For the first dataset, Nick Rose collected the data. At the time he was a student at UC Berkeley and used the data for him and others to practice machine learning. It was collected around 6 years ago and was made to see how crowded the gym was. The second dataset was collected by Nithilaa who is a data science student at PSG College Of Technology. It was collected just for survey reasons. The third dataset was made by Daniel Holmes who is most likely a student at University of Ottawa. There is no information on what they do there.

Most of the data was collected with the consent from the University, friends or gym so it did not need funding. For the first dataset, the people to benefit from this dataset are generally students looking to work with machine learning since that was the purpose. Outside of that it is meant for people looking to collect information relating to a college gym. This could be people in the college or gym industry. For the second dataset, it was most likely made just to benefit themselves as it was a survey among friends and classmates. For the third dataset it was collected to see if the gym should reopen certain facilities that were actively used. This means those most likely to benefit were those who used the gym facilities at University of Ottawa. 

The first dataset is not backed by anything beyond the consent of the University and gym. The second dataset does not contain much backing either as it is just information from surveys. The third dataset is similar to the first one where it is not backed by anything except the University and gym. Though the first and third dataset aren’t surveys and are just raw information from data from the University logs itself. 

All of the datasets were obtained from kaggle. We do credit the source of data. 


### Expected Implications

### Limitations 

One limitation behind our project is that our data is not directly from our university and is from another. The locational difference in our project may give us results that do not perfectly display what is accurate for the IMA. To adjust for this, we try to take in as many factors as possible like temperature, class, and season that we do share with the other university. The data we are using is from UC Berkeley.
A second limitation is that there could be reasons beyond data for why people may not be going to the gym. Things like school events are not necc sicily recorded in the data set which can lead people to use the gym more or less than what is considered a normal day. Events like Dawg Daze or parent weekend can change the amount of people that use the gym.

### Acknowledgements
We would like to acknowledge Thomas Winegarden and Yubing Tian for being great instructors. 

### References
Rose, Nick. “Crowdedness at the Campus Gym.” Kaggle 19 Mar. 2017, www.kaggle.com/datasets/nsrose7224/crowdedness-at-the-campus-gym.

A., Nithila. “Fitness Analysis.” Kaggle, 8 Sept. 2020, www.kaggle.com/datasets/nithilaa/fitness-analysis.

Holmes, Daniel. “University of Ottawa Workout Session Demand.” Kaggle, 18 Jan. 2022, www.kaggle.com/datasets/danielholmes/university-of-ottawa-workout-enrolment.

### Appendix A: Questions
We only have one dataset, but it is very thorough with **11** comprehensive variables and **26,000** observations which gives us plenty of data to work with. Can we go through with using just this dataset, as it is also very specific and it may be hard for us to find other relevant datasets that won't detract from our analysis? 
