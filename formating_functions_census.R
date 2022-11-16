date_format_census <- function(df, date_col, date_format, col_name){
  
  date_format <- str_extract_all(date_format, pattern = "[:alpha:]")[[1]]
  date_format_vec <- str_c("b", date_format)
  
  date_col <- rlang::ensym(date_col)
  
  df %>% 
    separate({{date_col}}, into=date_format_vec) %>% 
    unite(!!quo_name(col_name), by, bm, bd, sep="-") 
  
}

dx_code_description <- function(df, dx_col, dx_){
  
  colname <- rlang::ensym(dx_col)
  
  df %>% 
    select({{colname}}) %>% 
    mutate(dx_sep = str_replace({{colname}}, " ", "-")) %>% 
    separate(dx_sep, into=c("code", "description"), sep = "-") 
  
}
