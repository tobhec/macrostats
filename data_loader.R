remotes::install_github('zeugner/MDcountrycode'); 
remotes::install_github('zeugner/MD3'); #bit64 #zoo
remotes::install_github('zeugner/MDstats') #XML #rsdmx
library(MDstats)

countries <- list("Austria"     = "AT", 
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

indicators <- list("Monthly year-on-year inflation" = "ESTAT/prc_hicp_manr/M.RCH_A.CP00.",
                "Yearly average inflation" = "ESTAT/prc_hicp_aind/A.RCH_A_AVG.CP00.")

indic1 <- as.data.table(mds("ESTAT/prc_hicp_manr/M.RCH_A.CP00.SE", startPeriod = "2025-05"))
indic2 <- as.data.table(mds("ESTAT/prc_hicp_aind/A.RCH_A_AVG.CP00.SE+DE", startPeriod = "2022"))

indic1$Country <- "SE"
setnames(indic1, old = c("Country", "TIME", "obs_value"), new = c("Country", "Month", "Value"))
indic1 <- dcast(indic1, Country ~ Month, value.var = "Value")

setnames(indic2, old = c("geo", "TIME", "obs_value"), new = c("Country", "Year", "Value"))
indic2 <- dcast(indic2, Country ~ Year, value.var = "Value")

indics <- list("Monthly year-on-year inflation" = indic1, 
               "Yearly average inflation" = indic2)

links <- list("Monthly year-on-year inflation" = "https://ec.europa.eu/eurostat/databrowser/bookmark/2727efe6-8633-46b6-b6e7-1bd28a303fc0?lang=en", 
              "Yearly average inflation" = "https://ec.europa.eu/eurostat/databrowser/bookmark/687ce2e8-9c27-4660-aad0-896b206a973e?lang=en")



