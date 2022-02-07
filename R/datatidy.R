#' Data Scientists/Data Analyst/ Statistician Job Advertisements in the year 2020
#' @description Job advertisements
#' @format A data frame with 430 rows and 114 variables
#' \describe{
#' \item{ID}{row id}
#' \item{Consultant}{Name of the consultant}
#' \item{DateRetrieved}{ Date of Data Retrieved }
#' \item{DatePublished}{Published Date of the Advertisement  }
#' \item{Job_title}{ Name of the job category}
#' \item{Company}{Name of the Company}
#' \item{R}{If R is required -> 1 ,If not mentioned -> 0}
#' \item{SAS}{If SAS is required -> 1 , If not mentioned -> 0}
#' \item{SPSS}{If SPSS is required -> 1 , If not mentioned -> 0}
#' \item{Python}{If Python is required -> 1 , If not mentioned -> 0}
#' \item{MAtlab}{If Matlab is required -> 1 , If not mentioned -> 0}
#' \item{Scala}{If Scala is required -> 1 , If not mentioned -> 0}
#' \item{C_Sharp}{If C# is required -> 1 , If not mentioned -> 0}
#' \item{MS_Word}{If knowledge in MS Word is required -> 1 , If not mentioned -> 0}
#' \item{Ms_Excel}{If knowledge in MS Excel  is required -> 1 , If not mentioned -> 0}
#' \item{OLE_DB}{If knowledge in OLE/DB is required -> 1 , If not mentioned -> 0}
#' \item{Ms_Access}{If Ms Access is required -> 1 , If not mentioned -> 0}
#' \item{Ms_PowerPoint}{If knowledge in Ms Powerpoint is required -> 1 , If not mentioned -> 0}
#' \item{Spreadsheets}{If knowledge in Spreadsheets is required -> 1 , If not mentioned -> 0}
#' \item{Data_visualization}{If  knowledge inData Visualization  is required -> 1 , If not mentioned -> 0}
#' \item{Presentation_Skills}{If Presentation Skills are required -> 1 , If not mentioned -> 0}
#' \item{Communication}{If Communication skills are required -> 1 , If not mentioned -> 0}
#' \item{BigData}{If knowledge in Big Data analysis  is required -> 1 , If not mentioned -> 0}
#' \item{Data_warehouse}{If knowledge in Data Warehouse  is required -> 1 , If not mentioned -> 0}
#' \item{cloud_storage}{If knowledge in Cloud Storage  is required -> 1 , If not mentioned -> 0}
#' \item{Google_Cloud}{If knowledge in Google Cloud  is required -> 1 , If not mentioned -> 0}
#' \item{AWS}{If knowledge in AWS  is required -> 1 , If not mentioned -> 0}
#' \item{Machine_Learning}{If knowledge in Machine Learning is required -> 1 , If not mentioned -> 0}
#' \item{Deep_Learning}{If knowledge in Deep Learning is required -> 1 , If not entioned -> 0}
#' \item{Computer_vision}{If knowledge in Computer Vision is required -> 1 , If not mentioned -> 0}
#' \item{Java}{If Java is required -> 1 , If not mentioned -> 0}
#' \item{Cpp}{If C++ is required -> 1 , If not mentioned -> 0}
#' \item{C}{If C is required -> 1 , If not mentioned -> 0}
#' \item{Linux_Unix}{If knowledge in Linux/Unix is required -> 1 , If not mentioned -> 0}
#' \item{SQL}{If SQL is required -> 1 , If not mentioned -> 0}
#' \item{NoSQL}{If NoSQL is required -> 1 , If not mentioned -> 0}
#' \item{RDBMS}{If knowledge in RDBMS is required -> 1 , If not mentioned -> 0}
#' \item{Oracle}{If knowledge in Oracle is required -> 1 , If not mentioned -> 0}
#' \item{MySQL}{If MYSQL is required -> 1 , If not mentioned -> 0}
#' \item{PHP}{If PHP is required -> 1 , If not mentioned -> 0}
#' \item{Flash_Actionscript}{If knowledge in Flash Action Script is required -> 1 , If not mentioned -> 0}
#' \item{SPL}{If knowledge in SPL is required -> 1 , If not mentioned -> 0}
#' \item{web_design_and_development_tools}{If knowledge in Web Design and Development Tools is required -> 1 , If not mentioned -> 0}
#' \item{Wordpress}{If knowledge in Wordpress is required -> 1 , If not mentioned -> 0}
#' \item{AI}{If Artificial Intelligence is required -> 1 , If not mentioned -> 0}
#' \item{Natural_Language_Processing(NLP)}{If knowledge in NLP is required -> 1 , If not mentioned -> 0}
#' \item{Microsoft_Power_BI}{If knowledge in Microsoft Power BI is required -> 1 , If not mentioned -> 0}
#' \item{Google_Analytics}{If knowledge in Google Analytics  is required -> 1 , If not mentioned -> 0}
#' \item{graphics_and_design_skills}{If Graphic and Design Skills are required -> 1 , If not mentioned -> 0}
#' \item{Data_marketing}{If Data Marketing abillity is required -> 1 , If not mentioned -> 0}
#' \item{SEO}{If knowledge in SEO is required -> 1 , If not mentioned -> 0}
#' \item{Content_Management}{If knowledge in Content Management is required -> 1 , If not mentioned -> 0}
#' \item{Tableau}{If knowledge in Tableau is required -> 1 , If not mentioned -> 0}
#' \item{D3}{If knowledge in D3 is required -> 1 , If not mentioned -> 0}
#' \item{Alteryx}{If knowledge in Alteryx is required -> 1 , If not mentioned -> 0}
#' \item{KNIME}{If knowledge in KNIME is required -> 1 , If not mentioned -> 0}
#' \item{Spotfire}{If knowledge in Spotfire is required -> 1 , If not mentioned -> 0}
#' \item{Spark}{If knowledge in Spark is required -> 1 , If not mentioned -> 0}
#' \item{S3}{If knowledge in S3 is required -> 1 , If not mentioned -> 0}
#' \item{Redshift}{If knowledge in Redshift is required -> 1 , If not mentioned -> 0}
#' \item{DigitalOcean}{If knowledge in Digital Ocean is required -> 1 , If not mentioned -> 0}
#' \item{Javascript}{If Java Script is required -> 1 , If not mentioned -> 0}
#' \item{Kafka}{If knowledge in Kafka is required -> 1 , If not mentioned -> 0}
#' \item{Storm}{If knowledge in Storm is required -> 1 , If not mentioned -> 0}
#' \item{Bash}{If knowledge in Bash is required -> 1 , If not mentioned -> 0}
#' \item{Hadoop}{If knowledge in Hadoop is required -> 1 , If not mentioned -> 0}
#' \item{Data_Pipelines}{If knowledge in Data Pipelines is required -> 1 , If not mentioned -> 0}
#' \item{MPP_Platforms}{If MPP Platforms is required ->1,If not mentioned-0}
#' \item{Qlik}{If Qlik is required ->1,If not mentioned ->0}
#' \item{Pig}{If Pig is required ->1,If not mentioned ->0}
#' \item{Hive}{If Hive is required ->1,If not mentioned ->0}
#' \item{Tensorflow}{If Tensorflow is required ->1,If not mentioned ->0}
#' \item{Map_Reduce}{If Map/Reduce is required ->1,If not mentioned ->0}
#' \item{Impala}{If Impala is required ->1,If not mentioned ->0}
#' \item{Solr}{If Sloris required ->1,If not mentioned ->0}
#' \item{Teradata}{If Teradata is required ->1,If not mentioned ->0}
#' \item{MongoDB}{If MonoDB is required ->1,If not mentioned ->0}
#' \item{Elasticsearch}{If Elasticsearch is required ->1,If not mentioned ->0}
#' \item{YOLO}{If YOLO is required-1  ,If not mentioned-0}
#' \item{agile_execution}{If agile execution is required->1  ,If not mentioned->0}
#' \item{Data_management}{If the knowledge in data management is required->1  ,If not mentioned->0}
#' \item{pyspark}{If pyspark is required->1  ,If not mentioned->0 }
#' \item{Data_mining}{If the knowledge in data mining is required->1  ,If not mentioned->0}
#' \item{Data_science}{If the knowledge in data science is required->1  ,If not mentioned->0}
#' \item{Web_Analytic_tools}{If the knowledge in Web Analytic tools is required->1  ,If not mentioned->0}
#' \item{IOT}{If IOT is required->1  ,If not mentioned->0}
#' \item{Numerical_Analysis}{If the knowledge in Numerical Analysis is required->1  ,If not mentioned->0}
#' \item{Economic}{If the knowledge in Economic is required->1  ,If not mentioned->0}
#' \item{Finance_Knowledge}{If Finance_Knowledge  is required->1  ,If not mentioned->0}
#' \item{Investment_Knowledge}{If Investment Knowledge is required->1  ,If not mentioned->0}
#' \item{Problem_Solving}{If the ability of Problem Solving is required->1  ,If not mentioned->0}
#' \item{Korean_language}{If the ability of speaking Korean language is required->1  ,If not mentioned->0}
#' \item{Bash_Linux_Scripting}{If Bash\ Linux Scripting is required->1  ,If not mentioned->0}
#' \item{Knowledge_in}{Required knowledge to do a particular job ,If not mentioned->NA}
#' \item{City}{City where the company is located in }
#' \item{Location}{Country where the company is located in}
#' \item{Educational_qualifications}{Required educational qualifications}
#' \item{Salary}{Amount of salary}
#' \item{Team_Handling}{If the ability of Team Handling is required-1  ,If not mentioned-0}
#' \item{Debtor_reconcilation}{If the ability of Debtor reconciliation is required-1  ,If not mentioned-0}
#' \item{Payroll_management}{If the ability of Payroll management is required-1  ,If not mentioned-0}
#' \item{Bayesian}{If Bayesian knowledge is required-1  ,If not mentioned-0}
#' \item{Optimization}{If Optimization knowledge is required-1  ,If not mentioned-0}
#' \item{Bahasa_Malaysia}{If Bahasa Malaysia is required-1  ,If not mentioned-0 }
#' \item{English_proficiency}{If English proficiency is required-1  ,If not mentioned-0}
#' \item{URL}{Web address of a particular job advertisement}
#' \item{Search_Term}{web search term of a particular job advertisement}
#' \item{Job_Category}{Category of the job (i.e. "Data Science","Data Analyst" etc.)}
#' \item{Minimum_Years_of_experience}{Minimum years of experience needed for the job}
#' \item{Experience}{Minimum experience required for a particular job}
#' \item{Experience_Category}{Number of years of experience in binned into categories}
#' \item{Job_Country}{Country where job is located in}
#' \item{Edu_Category}{Type of educational qualification needed}
#' \item{Minimum_Salary}{Starting salary proposed in respective currency}
#' \item{Salary_Basis}{Payment basis of salary (i.e. "unspecified","hourly","daily","monthly","yearly")}
#' }
#' @source Data wrangling part was done by Chammika R. De Mel, Shashini D. Silva and Thimani D Ranathunga, BSc (Hons)Staistics, University of Sri
#' Jayewardenepura.
#' @examples
#' data(DStidy_2020)
#' head(DStidy_2020)
#' summary(DStidy_2020)
"DStidy_2020"

# TODO need to complete the following documentation
#' Data Scientists/Data Analyst/ Statistician Job Advertisements in the year 2021
#' @description Job advertisements collected in the year 2021
#' @format A data frame with 382 rows and 112 columns
#' \describe{
#' \item{ID}{row id}
#' \item{Consultant}{Name of the consultant}
#' \item{URL}{}
#' \item{Search_Term}{}
#' \item{DateRetrieved}{ Date of Data Retrieved }
#' \item{DatePublished}{Published Date of the Advertisement}
#' \item{Job_Field}{}
#' \item{Job_title}{}
#' \item{Company}{}
#' \item{Knowledge_in}{}
#' \item{Minimum Experience in Years}{}
#' \item{City}{}
#' \item{Location}{}
#' \item{Educational_qualifications}{}
#' \item{Payment Frequency}{}
#' \item{Currency}{}
#' \item{Salary}{}
#' \item{English Needed}{}
#' \item{English proficiency description}{}
#' \item{Additional_languages}{}
#' \item{AI}{}
#' \item{Natural_Language_Processing(NLP)}{}
#' \item{Data_Pipelines}{}
#' \item{Machine_Learning}{}
#' \item{Deep Learning}{}
#' \item{Computer_vision}{}
#' \item{Data_visualization}{}
#' \item{Data_warehouse}{}
#' \item{BigData}{}
#' \item{Data_management}{}
#' \item{Data_mining}{}
#' \item{Data_science}{}
#' \item{Bayesian}{}
#' \item{Optimization}{}
#' \item{Numerical_Analysis}{}
#' \item{IOT}{}
#' \item{Data_translation}{}
#' \item{R}{}
#' \item{SAS}{}
#' \item{SPSS}{}
#' \item{Python}{}
#' \item{MAtlab}{}
#' \item{Scala}{}
#' \item{C#}{}
#' \item{Java}{}
#' \item{C++}{}
#' \item{C}{}
#' \item{Bash}{}
#' \item{Tensorflow}{}
#' \item{pyspark}{}
#' \item{YOLO}{}
#' \item{MS Word}{}
#' \item{Ms Excel}{}
#' \item{Ms Access}{}
#' \item{Ms PowerPoint}{}
#' \item{Spreadsheets}{}
#' \item{Google_Analytics}{}
#' \item{Microsoft Power BI}{}
#' \item{Tableau}{}
#' \item{D3}{}
#' \item{Qlik}{}
#' \item{KNIME}{}
#' \item{Spotfire}{}
#' \item{Linux/Unix}{}
#' \item{OLE/DB}{}
#' \item{SQL}{}
#' \item{NoSQL}{}
#' \item{RDBMS}{}
#' \item{Oracle}{}
#' \item{MySQL}{}
#' \item{MongoDB}{}
#' \item{MPP_Platforms}{}
#' \item{SPL}{}
#' \item{Alteryx}{}
#' \item{Spark}{}
#' \item{Kafka}{}
#' \item{Hadoop}{}
#' \item{Pig}{}
#' \item{Hive}{}
#' \item{Map/Reduce}{}
#' \item{Impala}{}
#' \item{Storm}{}
#' \item{Google_Cloud}{}
#' \item{AWS}{}
#' \item{cloud_storage}{}
#' \item{S3}{}
#' \item{Redshift}{}
#' \item{DigitalOcean}{}
#' \item{Teradata}{}
#' \item{Solr}{}
#' \item{Elasticsearch}{}
#' \item{Presentation_Skills}{}
#' \item{Communication}{}
#' \item{Problem_Solving}{}
#' \item{Team_Handling}{}
#' \item{agile execution}{}
#' \item{Data_marketing}{}
#' \item{SEO}{}
#' \item{graphics_and_design_skills}{}
#' \item{Content_Management}{}
#' \item{Economic}{}
#' \item{Finance_Knowledge}{}
#' \item{Investment_Knowledge}{}
#' \item{Debtor_reconcilation}{}
#' \item{Payroll_management}{}
#' \item{web_design_and_development_tools}{}
#' \item{PHP}{}
#' \item{Javascript}{}
#' \item{Web_Analytic_tools}{}
#' \item{BSc_needed}{}
#' \item{MSc_needed}{}
#' \item{PhD_needed}{}
#' }
#' @source Data was sourced and wrangled by the BSc.Statistics Honors batch of 2016/2017
#' @examples
#' data(DStidy_2021)
#' head(DStidy_2021)
#' summary(DStidy_2021)
"DStidy_2021"

# TODO need to complete the following documentation
#' Data Scientists/Data Analyst/ Statistician Job Tracker
#' @description Combined collection of Job advertisements collected by the Statstical Consulting Service of the University of Sri Jayewardenepura
#' @format A data frame with 812 rows and 109 columns
#' \describe{
#' \item{ID}{row id}
#' \item{Consultant}{Name of the consultant}
#' \item{DateRetrieved}{ Date of Data Retrieved }
#' \item{DatePublished}{Published Date of the Advertisement  }
#' \item{Job_title}{ Name of the job category}
#' \item{Company}{Name of the Company}
#' \item{R}{If R is required -> 1 ,If not mentioned -> 0}
#' \item{SAS}{}
#' \item{SPSS}{}
#' \item{Python}{}
#' \item{MAtlab}{}
#' \item{Scala}{}
#' \item{C#}{}
#' \item{MS Word}{}
#' \item{Ms Excel}{}
#' \item{OLE/DB}{}
#' \item{Ms Access}{}
#' \item{Ms PowerPoint}{}
#' \item{Spreadsheets}{}
#' \item{Data_visualization}{}
#' \item{Presentation_Skills}{}
#' \item{Communication}{}
#' \item{BigData}{}
#' \item{Data_warehouse}{}
#' \item{cloud_storage}{}
#' \item{Google_Cloud}{}
#' \item{AWS}{}
#' \item{Machine_Learning}{}
#' \item{Deep Learning}{}
#' \item{Computer_vision}{}
#' \item{Java}{}
#' \item{C++}{}
#' \item{C}{}
#' \item{Linux/Unix}{}
#' \item{SQL}{}
#' \item{NoSQL}{}
#' \item{RDBMS}{}
#' \item{Oracle}{}
#' \item{MySQL}{}
#' \item{PHP}{}
#' \item{SPL}{}
#' \item{web_design_and_development_tools}{}
#' \item{AI}{}
#' \item{Natural_Language_Processing(NLP)}{}
#' \item{Microsoft Power BI}{}
#' \item{Google_Analytics}{}
#' \item{graphics_and_design_skills}{}
#' \item{Data_marketing}{}
#' \item{SEO}{}
#' \item{Content_Management}{}
#' \item{Tableau}{}
#' \item{D3}{}
#' \item{Alteryx}{}
#' \item{KNIME}{}
#' \item{Spotfire}{}
#' \item{Spark}{}
#' \item{S3}{}
#' \item{Redshift}{}
#' \item{DigitalOcean}{}
#' \item{Javascript}{}
#' \item{Kafka}{}
#' \item{Storm}{}
#' \item{Bash}{}
#' \item{Hadoop}{}
#' \item{Data_Pipelines}{}
#' \item{MPP_Platforms}{}
#' \item{Qlik}{}
#' \item{Pig}{}
#' \item{Hive}{}
#' \item{Tensorflow}{}
#' \item{Map/Reduce}{}
#' \item{Impala}{}
#' \item{Solr}{}
#' \item{Teradata}{}
#' \item{MongoDB}{}
#' \item{Elasticsearch}{}
#' \item{YOLO}{}
#' \item{agile execution}{}
#' \item{Data_management}{}
#' \item{pyspark}{}
#' \item{Data_mining}{}
#' \item{Data_science}{}
#' \item{Web_Analytic_tools}{}
#' \item{IOT}{}
#' \item{Numerical_Analysis}{}
#' \item{Economic}{}
#' \item{Finance_Knowledge}{}
#' \item{Investment_Knowledge}{}
#' \item{Problem_Solving}{}
#' \item{Team_Handling}{}
#' \item{Debtor_reconcilation}{}
#' \item{Payroll_management}{}
#' \item{Bayesian}{}
#' \item{Optimization}{}
#' \item{Knowledge_in}{}
#' \item{City}{}
#' \item{Educational_qualifications}{}
#' \item{Salary}{}
#' \item{URL}{}
#' \item{Search_Term}{}
#' \item{Job_Category}{}
#' \item{Experience_Category}{}
#' \item{Location}{}
#' \item{Payment Frequency}{}
#' \item{BSc_needed}{}
#' \item{MSc_needed}{}
#' \item{PhD_needed}{}
#' \item{English Needed}{}
#' \item{year}{}
#' }
#' @source Data collected and combined by the Statstical Consulting Service of University of Sri Jayewardenepura
"DStidy"
