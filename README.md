 # Data-Analysis-on-American-Bridge-Dataset

This is a data analysis project for an American Bridge Dataset with ~720k samples and ~140 columns. We first designed and implemented a database with 7 subtables based on our analysis needs. Then, we study the following three questions: 
1. Get the year for every state in the US when the largest number of bridges were built in that state.
2. Find out the main factors of bridges’ maintenance/improvement cost. 
3. The number of newly built bridges using different materials in all time.

For question 2, we studied the impacts of Average Daily Traffic, Length of a Structure, Material Type, and Structural Type on the bridge maintenance cost. Specifically, we use Gamma Coefficients to analyze correlations of 2 categorical variables. 

For question 3, we recognized 3 major trends in the number of new bridges of different materials. We managed to analyze these trends with support from both internal database and external sources.  

  

<figure>
  <img
  src="https://github.com/LiangSylar/Data-Analysis-on-American-Bridge-Dataset/assets/64362092/9db6ed0a-3c60-4062-b499-e153942c248b"
  alt="The beautiful MDN logo."
  width="600">
  <figcaption>An overview of the database structure.</figcaption>
</figure>
<br><br>
<figure>
  <img
  src="https://github.com/LiangSylar/Data-Analysis-on-American-Bridge-Dataset/assets/64362092/6d50c0ad-b418-436c-a1a9-8e9a51076690"
  alt="The beautiful MDN logo."
  width="400">
  <figcaption>Gamma coefficient analysis on Bridge length and Maintenance costs.</figcaption>
</figure>
<br><br>
<figure>
  <img
  src="https://github.com/LiangSylar/Data-Analysis-on-American-Bridge-Dataset/assets/64362092/df33aaac-cde8-4020-8c1c-dfc1e84416a6"
  alt="The beautiful MDN logo."
  width="600">
  <figcaption>The yearly number of new bridges in different main span materials with 3 dominant trends.</figcaption>
</figure>
 
