
# Function to get the data from the web used for several kind of data

get_data=function(x_path,url){
  
  #
  webpage <- read_html(url)
  
  #
  data_html <- html_nodes(webpage,xpath=x_path)
  
  # Converting the ranking data to text
  data <- html_table(data_html,fill=TRUE)
  
  #
  res = NULL
  res$dataframe = data
  return(res)
}