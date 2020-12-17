# fb-dash
➡️ ***<a href = "https://yeeryan.github.io/fb-dash/">View the Dashboard</a>*** ⬅️

## 🎯 Goal
The goal of this project is to create a dashboard similar to Facebook Ads Manager's that can be integrated in into reports or shared on its own. This is to provide teams located in regions that don't have access to Facebook a way to view data from Facebook Ads. 

**Data has been replaced with dummy data to showcase implementation**

### 📍 Planned Features
* Map overview by U.S. state/territory ☑️
  * Mouse overviews that show reach, impressions, CPC, CTR ☑️
  * Adjustable color gradient based on reach, impression, CPC, CTR ☑️
* Adjustable viz of audience breakdown by gender ☑️ 
  * Adjustable chart based on reach, impression, CPC, CTR ☑️
* Adjustable viz of audience breakdown by age brackets ☑️
  * Adjustable chart based on reach, impression, CPC, CTR ☑️

### Packages Used
- tidyverse
- flexdashboard
- maps
- plotly
- leaflet


## Usage Instructions
A. View the dashboard <a href = "https://yeeryan.github.io/fb-dash/">here</a>.

**OR**

B. Use R to recreate the interactive dashboard with the following instructions:
 1. Install the packages used in R with the following command:
 
 `install.packages(c("tidyverse","flexdashboard","maps","plotly","leaflet"))`
 
 2. Clone the repository
 3. Open `dashboard.Rmd` in the project's root folder in Rstudio
 4. Knit `dashboard.Rmd` to generate an interactive dashboard


