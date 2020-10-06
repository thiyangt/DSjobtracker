#' Data Scientists/Data Analyst/ Statistician Job Tracker
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
#' data(DStidy)
#' head(DStidy)
#' summary(DStidy)
"DStidy"

