
# DSjobtracker

<img src="man/figures/hexsticker.png" align="right" height="200"/>

What skills and qualifications are required for data science related
jobs?

# Installation

``` r
#install.packages("devtools")
devtools::install_github("thiyangt/DSjobtracker")
library(DSjobtracker)
```

# Glimpse of tidy data

``` r
tibble::glimpse(DStidy)
```

    Rows: 430
    Columns: 115
    $ ID                                 <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,…
    $ Consultant                         <chr> "Thiyanga", "Jayani", "Jayani", "J…
    $ DateRetrieved                      <date> 2020-08-05, 2020-08-07, 2020-08-0…
    $ DatePublished                      <date> NA, 2020-07-31, 2020-08-06, 2020-…
    $ Job_title                          <chr> NA, "Junior Data Scientist", "Engi…
    $ Company                            <chr> NA, "Dialog Axiata PLC", "London S…
    $ R                                  <fct> 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0…
    $ SAS                                <fct> 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0…
    $ SPSS                               <fct> 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0…
    $ Python                             <fct> 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0…
    $ MAtlab                             <fct> 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Scala                              <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ C_Sharp                            <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ MS_Word                            <fct> 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1…
    $ Ms_Excel                           <fct> 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1…
    $ OLE_DB                             <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Ms_Access                          <fct> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1…
    $ Ms_PowerPoint                      <fct> 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0…
    $ Spreadsheets                       <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Data_visualization                 <fct> 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0…
    $ Presentation_Skills                <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Communication                      <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ BigData                            <fct> 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0…
    $ Data_warehouse                     <fct> 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ cloud_storage                      <fct> 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Google_Cloud                       <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ AWS                                <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Machine_Learning                   <fct> 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0…
    $ Deep_Learning                      <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Computer_vision                    <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Java                               <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0…
    $ Cpp                                <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ C                                  <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ Linux_Unix                         <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ SQL                                <fct> 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 0…
    $ NoSQL                              <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ RDBMS                              <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Oracle                             <fct> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0…
    $ MySQL                              <fct> 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0…
    $ PHP                                <fct> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0…
    $ Flash_Actionscript                 <fct> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0…
    $ SPL                                <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ web_design_and_development_tools   <fct> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0…
    $ Wordpress                          <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ AI                                 <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ `Natural_Language_Processing(NLP)` <fct> 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0…
    $ Microsoft_Power_BI                 <fct> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Google_Analytics                   <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ graphics_and_design_skills         <fct> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0…
    $ Data_marketing                     <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ SEO                                <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Content_Management                 <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Tableau                            <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0…
    $ D3                                 <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0…
    $ Alteryx                            <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ KNIME                              <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Spotfire                           <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Spark                              <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0…
    $ S3                                 <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ Redshift                           <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ DigitalOcean                       <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ Javascript                         <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ Kafka                              <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Storm                              <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Bash                               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Hadoop                             <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0…
    $ Data_Pipelines                     <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ MPP_Platforms                      <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Qlik                               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Pig                                <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Hive                               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0…
    $ Tensorflow                         <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Map_Reduce                         <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Impala                             <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Solr                               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Teradata                           <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ MongoDB                            <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Elasticsearch                      <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ YOLO                               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ agile_execution                    <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0…
    $ Data_management                    <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ pyspark                            <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Data_mining                        <fct> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0…
    $ Data_science                       <fct> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0…
    $ Web_Analytic_tools                 <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ IOT                                <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Numerical_Analysis                 <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Economic                           <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Finance_Knowledge                  <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Investment_Knowledge               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Problem_Solving                    <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Korean_language                    <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Bash_Linux_Scripting               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Team_Handling                      <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Debtor_reconcilation               <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Payroll_management                 <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Bayesian                           <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Optimization                       <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Bahasa_Malaysia                    <fct> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0…
    $ Knowledge_in                       <chr> NA, NA, "Elasticsearch, Logstash, …
    $ City                               <chr> NA, "Colombo", "Colombo", "Colombo…
    $ Location                           <chr> "NY", "LK", "LK", "LK", "LK", "Mal…
    $ Educational_qualifications         <chr> NA, "Degree in Engineering / IT or…
    $ Salary                             <chr> NA, NA, NA, NA, NA, NA, NA, NA, NA…
    $ English_proficiency                <chr> NA, NA, NA, NA, NA, NA, "1", NA, N…
    $ URL                                <chr> NA, "https://www.google.com/search…
    $ Search_Term                        <chr> NA, "Data Analysis Jobs in Sri Lan…
    $ Job_Category                       <fct> Unimportant, Data Science, Data Sc…
    $ Minimum_Years_of_experience        <dbl> 4, 2, 1, 2, 0, 5, 0, 0, 1, 7, 5, 2…
    $ Experience                         <chr> "4+", "2-3", "1-2", "2+", "0 years…
    $ Experience_Category                <fct> More than 2 and less than 5 years,…
    $ Job_Country                        <chr> NA, "Sri Lanka", "Sri Lanka", "Sri…
    $ Edu_Category                       <chr> NA, "Some Degree", "Some Degree", …
    $ Minimum_Salary                     <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA…
    $ Salary_Basis                       <fct> unspecified, unspecified, unspecif…

# Preview of the tidy version of the dataset

``` r
head(DStidy)
```

    # A tibble: 6 x 115
         ID Consultant DateRetrieved DatePublished Job_title Company R     SAS  
      <int> <chr>      <date>        <date>        <chr>     <chr>   <fct> <fct>
    1     1 Thiyanga   2020-08-05    NA            <NA>      <NA>    1     1    
    2     2 Jayani     2020-08-07    2020-07-31    Junior D… Dialog… 1     0    
    3     3 Jayani     2020-08-07    2020-08-06    Engineer… London… 0     0    
    4     4 Jayani     2020-08-07    2020-07-24    CI-Stati… E.D. B… 1     1    
    5     5 Jayani     2020-08-07    2020-07-24    DA-Data … E.D. B… 0     1    
    6     6 Jayani     2020-08-07    2020-08-13    Data Sci… Emirat… 1     0    
    # … with 107 more variables: SPSS <fct>, Python <fct>, MAtlab <fct>,
    #   Scala <fct>, C_Sharp <fct>, MS_Word <fct>, Ms_Excel <fct>, OLE_DB <fct>,
    #   Ms_Access <fct>, Ms_PowerPoint <fct>, Spreadsheets <fct>,
    #   Data_visualization <fct>, Presentation_Skills <fct>, Communication <fct>,
    #   BigData <fct>, Data_warehouse <fct>, cloud_storage <fct>,
    #   Google_Cloud <fct>, AWS <fct>, Machine_Learning <fct>, Deep_Learning <fct>,
    #   Computer_vision <fct>, Java <fct>, Cpp <fct>, C <fct>, Linux_Unix <fct>,
    #   SQL <fct>, NoSQL <fct>, RDBMS <fct>, Oracle <fct>, MySQL <fct>, PHP <fct>,
    #   Flash_Actionscript <fct>, SPL <fct>,
    #   web_design_and_development_tools <fct>, Wordpress <fct>, AI <fct>,
    #   `Natural_Language_Processing(NLP)` <fct>, Microsoft_Power_BI <fct>,
    #   Google_Analytics <fct>, graphics_and_design_skills <fct>,
    #   Data_marketing <fct>, SEO <fct>, Content_Management <fct>, Tableau <fct>,
    #   D3 <fct>, Alteryx <fct>, KNIME <fct>, Spotfire <fct>, Spark <fct>,
    #   S3 <fct>, Redshift <fct>, DigitalOcean <fct>, Javascript <fct>,
    #   Kafka <fct>, Storm <fct>, Bash <fct>, Hadoop <fct>, Data_Pipelines <fct>,
    #   MPP_Platforms <fct>, Qlik <fct>, Pig <fct>, Hive <fct>, Tensorflow <fct>,
    #   Map_Reduce <fct>, Impala <fct>, Solr <fct>, Teradata <fct>, MongoDB <fct>,
    #   Elasticsearch <fct>, YOLO <fct>, agile_execution <fct>,
    #   Data_management <fct>, pyspark <fct>, Data_mining <fct>,
    #   Data_science <fct>, Web_Analytic_tools <fct>, IOT <fct>,
    #   Numerical_Analysis <fct>, Economic <fct>, Finance_Knowledge <fct>,
    #   Investment_Knowledge <fct>, Problem_Solving <fct>, Korean_language <fct>,
    #   Bash_Linux_Scripting <fct>, Team_Handling <fct>,
    #   Debtor_reconcilation <fct>, Payroll_management <fct>, Bayesian <fct>,
    #   Optimization <fct>, Bahasa_Malaysia <fct>, Knowledge_in <chr>, City <chr>,
    #   Location <chr>, Educational_qualifications <chr>, Salary <chr>,
    #   English_proficiency <chr>, URL <chr>, Search_Term <chr>,
    #   Job_Category <fct>, …

# Preview of the untidy version of the dataset

``` r
head(DSraw)
```

    # A tibble: 6 x 152
         ID Consultant DateRetrieved DatePublished Job_title Company     R   SAS
      <dbl> <chr>      <chr>         <chr>         <chr>     <chr>   <dbl> <dbl>
    1     1 Thiyanga   05/08/2020    <NA>          <NA>      <NA>        1     1
    2     2 Jayani     07/08/2020    31/07/2020    Junior D… Dialog…     1     0
    3     3 Jayani     07/08/2020    06/08/20      Engineer… London…     0     0
    4     4 Jayani     07/08/2020    24/07/2020    CI-Stati… E.D. B…     1     1
    5     5 Jayani     07/08/2020    24/07/2020    DA-Data … E.D. B…     0     1
    6     6 Jayani     07/08/2020    13/08/2020    Data Sci… Emirat…     1     0
    # … with 144 more variables: SPSS <dbl>, Python <dbl>, MAtlab <dbl>,
    #   Scala <dbl>, `C#` <dbl>, `MS Word` <dbl>, `Ms Excel` <dbl>, `OLE/DB` <dbl>,
    #   `Ms Access` <dbl>, `Ms PowerPoint` <dbl>, Spreadsheets <dbl>,
    #   Data_visualization <dbl>, Presentation_Skills <dbl>, Communication <dbl>,
    #   BigData <dbl>, Data_warehouse <dbl>, cloud_storage <dbl>,
    #   Google_Cloud <dbl>, AWS <dbl>, Machine_Learning <dbl>, `Deep
    #   Learning` <dbl>, Computer_vision <dbl>, Java <dbl>, `C++` <dbl>, C <dbl>,
    #   `Linux/Unix` <dbl>, SQL <dbl>, NoSQL <dbl>, RDBMS <dbl>, Oracle <dbl>,
    #   MySQL <dbl>, PHP <dbl>, Flash_Actionscript <dbl>, SPL <dbl>,
    #   web_design_and_development_tools <dbl>, Wordpress <dbl>, AI <dbl>,
    #   `Natural_Language_Processing(NLP)` <dbl>, `Microsoft Power BI` <dbl>,
    #   Google_Analytics <dbl>, graphics_and_design_skills <dbl>,
    #   Data_marketing <dbl>, SEO <dbl>, Content_Management <dbl>, Tableau <dbl>,
    #   D3 <dbl>, Alteryx <dbl>, KNIME <dbl>, Spotfire <dbl>, Spark <dbl>,
    #   S3 <dbl>, Redshift <dbl>, DigitalOcean <dbl>, Javascript <dbl>,
    #   Kafka <dbl>, Storm <dbl>, Bash <dbl>, Hadoop <dbl>, Data_Pipelines <dbl>,
    #   MPP_Platforms <dbl>, Qlik <dbl>, Pig <dbl>, Hive <dbl>, Tensorflow <dbl>,
    #   `Map/Reduce` <dbl>, Impala <dbl>, Solr <dbl>, Teradata <dbl>,
    #   MongoDB <dbl>, Elasticsearch <dbl>, YOLO <dbl>, `agile execution` <dbl>,
    #   Data_management <dbl>, pyspark <dbl>, Data_mining <dbl>,
    #   Data_science <dbl>, Web_Analytic_tools <dbl>, IOT <dbl>,
    #   Numerical_Analysis <dbl>, Economic <dbl>, Finance_Knowledge <dbl>,
    #   Investment_Knowledge <dbl>, Problem_Solving <dbl>, Korean_language <dbl>,
    #   `Bash\\Linux Scripting` <dbl>, Knowledge_in <chr>, Experience <chr>,
    #   City <chr>, Location <chr>, Educational_qualifications <chr>, Salary <chr>,
    #   Team_Handling <dbl>, Debtor_reconcilation <dbl>, Payroll_management <dbl>,
    #   Bayesian <dbl>, Optimization <dbl>, `Bahasa Malaysia` <dbl>, `English
    #   proficiency` <chr>, URL <chr>, Search_Term <chr>, …

## About the project

Project under [Statistical Consulting
Service](https://scs-fas-sjp.netlify.app/), University of Sri
Jayewardenepura, Sri Lanka.

Data collection and Entry: BSc (Hons) Statistics, 2020 Undergraduates

Data wrangling: Chammika De Mel, Shashini, Thimani

Data wrangling dashboard: Jayani Lakshika

Hex Sticker image design: Piumika

Column keys:

Package development contributor: Janith Wanniarachchi
