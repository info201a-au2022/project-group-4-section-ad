# INTRODUCTION

intro_blurb <- "Have you ever wanted to get into working out, but always thought that the IMA was too intimidating?
According to the New York post, almost 50% of Americans are intimidated by the prospect of working out
at a public gym. This project seeks to alleviate this issue for University of Washington students by answering the following question: How many people
are at the IMA at any given time? To answer this question, we are analyzing data gathered on how crowded Berkeley's campus gym is throughout the year.
We hope that by answering this topic, we're able to help students new to the IMA find less crowded times
to workout and get started. Additionally, even seasoned gym-goers will be able to use our project to find the
optimal time to work out for maximum efficiency."

data_set_description <- "Our dataset contains gym population attendance overtime at another large public university
on the west coast of America. The data includes other observations such as temperature, season, weather conditions,
holiday, etc... Our project is focused on analyzing how different factors affect gym attendance
in order to ultimately provide gym-goers with better times to go to the gym, as well as provide newcomers a
welcoming space to get started."

#INTERACTIVE 1

int1_description <- "Using this tool, users can pick any date within the next year and receive an approximation of how busy the gym will be per hour.
In general, it is best to go during mornings with numbers picking up closer to 5 PM and staying busy throughout the night. "

int1_description2 <- "Additionally, users can pick a time range within the day that they have chosen in order to receive a filtered view of only
times that are applicable to them. To better display the difference in attendance per hour, the newly displayed plot is a barchart with heatmap elements."

#INTERACTIVE 2

int2_description <- "Using this tool, users can filter data and find out how holiday and weekends affect gym status,
both separately and together."

int2_addendum <- "IMPORTANT: There is no available gym data for days that are both holidays and weekends.
It is best to assume that the IMA is closed on a weekend holiday."

#INTERACTIVE 3

int3_description <- "This tool allows the user to interact with the scatterplot and get information. Clicking or double clicking on any part
     of the scatterplot will allow you to get and store the temperature and number of people at that point. Hovering over the scatterplot
     will change depending on wherever the users cursor is. Than if the users holds and moves there cursor to brush a small,
     the user will get the highest and lowest amount of people and temperature within the box."

#TAKEAWAYS
summary_takeaways <- "In the first chart, we wanted to analyze the amount of people that were at the gym at any given
                      day or time. To demonstrate this, we decided that a heatmap would be best. Looking at the heatmap, a user can pick
                      any date and the times for that date, and find how busy the gym is. By looking at the date 12/7/2022,
                      a user can see that the time around 5:00 pm would be the best time to go to avoid people."

summary_takeaways_2 <- "The second chart was created with the intent to see if there were special parameters that increased
                        or decreased the amount of people at the gym. By making a bar chart, we are able to see that the start
                        of a semester has more people than during the semester. We can also see trends with holidays
                        and weekends which can allow a user to see if how busy the gym is during special days. An user
                        can see that the gym is less busy during the quarter than at the start."

summary_takeaways_3 <- "The third chart was more focused on how temperature affects the activities levels of the gym. To
                        help find out how it does, we created a scatterplot that alllows an user to look through the entire
                        dataset themselves and see how busy the gym is at any given temperature. They can hold over 70 degrees
                        and see that the person count could go over 100. But they can also see that as the temperature lowers
                        less people go to the gym."

#REPORT

authors <- "This project was made by Justin Dong and David Pham"

affiliation <- "INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"

report_date <- "Autumn 2022"

abstract <- "Our main question is how do external factors affect people's willingness to go
to the gym. This question is important because in order to make gym-going easier, we want to
provide newcomers times to go to the gym when crowdiness is at its least. To address this question,
we will perform an analysis on teamperature, weather, seasons, time, and their relationship on
gym crowdiness."

keywords <- "Gym, fitness, foot traffic "

report_introduction <- "The Intramural Activities building (IMA)  is one of many great resources offered to students
attending the University of Washington. Although the IMA is free, many students still do not take full advantage
of the facility due to the intimidating environment that surrounds the building. Our goal with this project is
to make going to the IMA easier for students who are looking to start working out. We plan to primarily address
this issue by analyzing a dataset (https://www.kaggle.com/datasets/nsrose7224/crowdedness-at-the-campus-gym?datasetId=527)
that tracks crowdiness at a campus gym."

report_introduction_2 <- "In order to effectively provide students a comprehensive idea of when good times to go to
the gym are, we’ll pull data of crowdiness at different times by weekday, with exceptions on holidays. Seeing as how
the University gym (Brekeley) in the dataset is of a very similar size, crowdedness is assumed to be similar in number.
Additional segmentations for the dataset includes weather, seasons, and temperature. All of this data will be analyzed
and provided to students to find a good time to go to the gym when crowdiness is at it’s minimum."

values <- "The main value our project is revolved around is gym accesibility. People often want to start going to the gym,
yet according to a survey done by better.org, almost 20% of people who don't go to the gym due to confidence issues.
Our goal is to provide people with a time where the gym is least busy, thus allowing for a more private workout. Additionally,
our secondary value is to focus on timeliness. According to better.org, the leading barrier to going to the gym for many people
is timeliness, with almost 40% of people choosing this option. The second and third biggest barriers are lack of confidence and gym crowdiness - both issues we can solve.
By providing people with times during which the IMA has the least amount of people, we hope to help people speed up their workouts."

direct_stakeholders <- "Direct stakeholders in our project are people who want to go to the campus gym and workout but do not have the confidence to. According to topfitnessmag.com, the number one reason why people do not work out is due to feeling self conscious. Our direct stakeholders would directly use our project to find out times when they can go and not be intimidated by a big crowd at the gym. Additionally, another direct stakeholder in our project are people who want to go to the gym but do not have enough time. They would use our project to find good times to go to the gym and get a fast work out in. "

indirect_stakeholders <- "The indirect stakeholders in our project are people who go to the campus gym in general, as although they may have plenty of time and no issues going to the gym, our project is collecting data on them in order to provide an analysis."

harms <- "One issue with our project is that it may lead to more crowding in the gym during times where foot traffic has historically been low. This is due to our project recommending the same time for a particular day as the least busy for everyone using our project. This would lead to our project working against its own goal. A workaround to this would be to update data as our project is being used, and accordingly spread people out."

benefits <- "One benefit to our project is that it will help people find better times to go to the gym. According to pschologist Adam Mulligan from psychreg.org, one of the biggest reasons people stop working out is due to embarassment and intimidation or time constraint. Whether it be people who do not have the confidence to go to a crowded gym or people who have no time to spare, the project can benefit everyone who goes to the gym."

question_1 <- "Is there a relationship between time of day and gym crowdiness?"

question_1_description <- "Each day comes with different commitments - people may be busy with class and commitments one day, but have nothing on the weekends. We want to see whether there are big differences in the amount of people at the gym at
different times with the goal of finding the best time to go to the gym per day."

question_2 <- "How does temperature affect people’s willingness to go to the gym?"

question_2_description <- "Weather condition is an important factor when people decide to go outside or not, and going to the IMA is no exception. We want to see if there is a connection between harsh weather and gym attendance with the goal of specifically establishing a trend in temperature and attendance."

question_3 <- "Do weekends and holidays affect gym traffic?"

question_3_description <- "Holidays and seasons may have an effect on gym attendance - an example of this would be a spike in gym traffic following New Year or a dip in gym traffic during Thanksgiving break. We want to find out whether holidays affect gym attendance and on an even broader scale, whether different seasons have varying attendance levels."

dataset1 <- "The first dataset we have is from UC Berkeley relating to their gym crowding during the school year. The dataset includes things like temperature, day of week, and points in the school year. Since the focus of our project is to make it as easy for people to go to the gym, this dataset can help us find when the gym is less busy so it is less intimidating and easier to navigate. The second dataset is about a college age friend group about when they went to the gym. It includes how often they went to the gym and motivations around them. As these are college students going to the gym, they can contribute to the data from the first dataset. The third dataset is similar to the first one where it includes timestamps for when people worked out and how packed the gym was at that point. This can also contribute to the data from the first dataset because it shows exactly how packed the gym was at each time. "

dataset2 <- "For the first dataset, Nick Rose collected the data. At the time he was a student at UC Berkeley and used the data for him and others to practice machine learning. It was collected around 6 years ago and was made to see how crowded the gym was. The second dataset was collected by Nithilaa who is a data science student at PSG College Of Technology. It was collected just for survey reasons. The third dataset was made by Daniel Holmes who is most likely a student at University of Ottawa. There is no information on what they do there."

dataset3 <- "Most of the data was collected with the consent from the University, friends or gym so it did not need funding. For the first dataset, the people to benefit from this dataset are generally students looking to work with machine learning since that was the purpose. Outside of that it is meant for people looking to collect information relating to a college gym. This could be people in the college or gym industry. For the second dataset, it was most likely made just to benefit themselves as it was a survey among friends and classmates. For the third dataset it was collected to see if the gym should reopen certain facilities that were actively used. This means those most likely to benefit were those who used the gym facilities at University of Ottawa."

dataset4 <- "The first dataset is not backed by anything beyond the consent of the University and gym. The second dataset does not contain much backing either as it is just information from surveys. The third dataset is similar to the first one where it is not backed by anything except the University and gym. Though the first and third dataset aren’t surveys and are just raw information from data from the University logs itself."

dataset_acknowledgement <- "All of the datasets were obtained from kaggle. We do credit the source of data."

limitations <- "One limitation behind our project is that our data is not directly from our university and is from another. The locational difference in our project may give us results that do not perfectly display what is accurate for the IMA. To adjust for this, we try to take in as many factors as possible like temperature, class, and season that we do share with the other university. The data we are using is from UC Berkeley.
A second limitation is that there could be reasons beyond data for why people may not be going to the gym. Things like school events are not necc sicily recorded in the data set which can lead people to use the gym more or less than what is considered a normal day. Events like Dawg Daze or parent weekend can change the amount of people that use the gym."

findings1 <- "Regarding the time of day and gym crowdiness, we found that the gym tends to be least busy in the morning. This may be due to the fact that college students generally sleep later and wake up later than other demographics, making it hard for them to attend the gym early. We found that the gym tends to get more and more busy getting closer to 5:00 PM, which was expected as that is when most students are finished with class. Gym attendance stays high throughout the night, only tapering down near the later hours when the gym is about to close.
It is important to note, though, that gym attendance throughout a certain day is also affected by holidays and weekends - something that will be discussed later."

findings2 <- "Our data shows that gym attendance drops during the holidays. This is understandable, as many people are on vacation during holidays and thus would not be able to attend the gym. Another important point to consider however, is that many gyms are closed over the holidays. While one might think that more people would attend the gym over the weekends when they have free time, our data shows that attendance actually drops over the weekends.This makes sense when considering the fact that many people treat the weekends as days of rest to either stay at home or go out and have fun."

findings3 <- "Before discussing our findings for temperature, it is important to note that the campus gym of focus from the dataset we used sports higher temperatures year round. From the data we have, we can see a clear trend that low temperatures are correlated with lower gym attendance. This is understandable, as cold weather often discourages people from going outside. On the other hand, while gym attendance numbers are higher during days with hot weather, the days with highest gym attendance are days with mild temperature ratings. For the dataset in question, this means gym attendance is highest when temperature is close to 64 degrees. "

discussion <- "The findings of this project are relevant as it can solve one of the big issues that people have with going to the gym. Our group expects that the findings if this project will help convince those who were hesitant to workout and/or get started to starting going to the gym. Although there might be more things stopping someone from going to the gym than crowdedness, solving one issue can help alleviate some issues. The importance of our first finding is that it solves what time is better to avoid people at the gym. Since the morning or near closing is when the gym has the lowest, it sets a time standard that people can build their schedule around if they want to go to the gym. Helping people build a schedule can help people waste less time or have less uncertainty in their own life. Waiting on equipment or leaving extra time for those type of issues can demotivate someone from going to the gym.
                For our second finding, it determines whether or not someone should go to the gym during a certain period or event. One surprising one for many people is that usually less people go to the gym on weekends which could help motivate someone to go to the gym if they want to avoid people. There's also less people going to the gym as the quarter progresses which could help motivate someone too. For the third finding, knowing the general amount of people for each temperature can help someone decide whether they want to go the gym or not. If they know the temperature is around 65 degrees, than they know the gym should be pretty active while on the other hand if they know the temperature is around 40, than they know less people are at the gym. We expect these findings to help motivate people to help people start going to the gym. And if someone is
               already going to the gym, we hope that it could help balance out and make the gym less crowdy at certain times for everyone. Helping balance out the gym crowdedness will help reduce people standing around and wasting time waiting on equipment. This can increase efficiency not only for the people working out but the gym too. We hope these findings are presented to people that have access to the IMA to encourage them to start using the facility if they do not already. "

conclusion <- "In conclusion, our group found that there are certain times, periods, and settings where the gym is less crowded which can help motivated people to start going to the gym or keep going to the gym. The IMA (Intramural Activities Building) is University of Washingtons premier recreation center that all students have access to. But for many, the gym can be intimidating as most people are scared to work out in a public gym. So to solve this issue, our group worked to solve and alleviate  the gym crowdedness issue that many face. To do this, we started looking for factors that contributed to people going to the gym more or less while still keeping in mind our local area. We attained gym activities level from another public university (UC Berkeley) and worked to mitigate the difference to relate it to our school as much as possible. With that, we then begun a data analysis seeking for core topics that affect gym crowdedness. Where we were left out were key ideas like time, day, temperature, and the type of day. These key ideas were than organized into charts where we found the important pieces for each of them.
               We found out that the gym is least crowded in the morning and near closing. We also found out that periods like deeper in the semester or the weekend usually have less people going to the gym. Along with how lower or higher temperature away from mild usually have less people. These important ideas can help someone new go to the gym to avoid crowdedness. And if someone is already going to the IMA, than it can help them find a time to avoid people and make the gym more balanced in people during all times. Doing this allows less people to have to wait for equipment which can help the gym and the people going to the gym. People going to the gym dont necessarily even have to go at the lowest times as the data also shows times when the gym has the most people. This can allow people to choose a time while it might not be the lowest, but still have less people and still work with their schedule.
               Allowing people to fit the gym into the schedule can lead to more people going to the gym. This is a big issue with all of the work university students have since they have to worry about there classes if not other things like a job. Helping alleviate this issue with gym crowdedness help remove one issue out of the many that university students have."


acknowledgement <- "We would like to acknowledge Thomas Winegarden and Yubing Tian for being great instructors."

reference1 <- "Rose, Nick. “Crowdedness at the Campus Gym.” Kaggle 19 Mar. 2017, www.kaggle.com/datasets/nsrose7224/crowdedness-at-the-campus-gym."

reference2 <- "A., Nithila. “Fitness Analysis.” Kaggle, 8 Sept. 2020, www.kaggle.com/datasets/nithilaa/fitness-analysis."

reference3 <- "Holmes, Daniel. “University of Ottawa Workout Session Demand.” Kaggle, 18 Jan. 2022, www.kaggle.com/datasets/danielholmes/university-of-ottawa-workout-enrolment."

reference4 <- "Jeff, and *. “5 Reasons Why People Avoid the Gym.” Top Fitness Magazine, 21 Oct. 2019, https://www.topfitnessmag.com/5-reasons-people-avoid-gym/."

reference5 <- "Unknown. “Better, the Feel Good Place.” A Charitable Social Enterprise. Join Us Now., https://www.better.org.uk/content_pages/top-gym-excuses."

reference6 <- "Mulligan, Adam. “Why People Stop Going to the Gym.” Psychreg, 16 May 2022, https://www.psychreg.org/why-people-stop-going-gym/. "