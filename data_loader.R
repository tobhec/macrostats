remotes::install_github('zeugner/MDcountrycode'); 
remotes::install_github('zeugner/MD3'); #bit64 #zoo
remotes::install_github('zeugner/MDstats') #XML #rsdmx
library(MDstats)

countries <- c("Austria"     = "AT", 
               "Belgium"     = "BE", 
               "Bulgaria"    = "BG", 
               "Cyprus"      = "CY", 
               "Czechia"     = "CZ", 
               "Germany"     = "DE", 
               "Denmark"     = "DK", 
               "Estonia"     = "EE", 
               "Greece"      = "EL", 
               "Spain"       = "ES", 
               "Finland"     = "FI", 
               "France"      = "FR", 
               "Croatia"     = "HR", 
               "Hungary"     = "HU", 
               "Ireland"     = "IE", 
               "Italy"       = "IT", 
               "Lithuania"   = "LT", 
               "Luxembourg"  = "LU", 
               "Latvia"      = "LV", 
               "Malta"       = "MT", 
               "Netherlands" = "NL",
               "Poland"      =  "PL", 
               "Portugal"    = "PT", 
               "Romania"     = "RO", 
               "Sweden"      = "SE", 
               "Slovenia"    = "SI", 
               "Slovakia"    = "SK")

years <- c("2025", "2024", "2023", "2022", "2021", "2020", 
           "2019", "2018", "2017", "2016", "2015", "2014", 
           "2013", "2012", "2011", "2010")

indicators <- c("Monthly year-on-year inflation" = "ESTAT/prc_hicp_manr/M.RCH_A.CP00.",
                "Yearly average inflation" = "ESTAT/prc_hicp_aind/A.RCH_A_AVG.CP00.")

as.data.table(mds("ESTAT/prc_hicp_manr/M.RCH_A.CP00.SE", startPeriod = 2025))








