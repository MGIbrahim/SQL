SELECT * FROM covid_deaths;

SELECT location,date,total_cases,new_cases,total_deaths,population
FROM covid_deaths
ORDER BY 1,2;

-- Total number of cases vs Total Deaths per Country
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 AS deathpercentage
FROM covid_deaths
WHERE location ILIKE '%states%' AND date <= '2020-12-31'
ORDER BY 1,2;

SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 AS deathpercentage
FROM covid_deaths
WHERE location = 'Germany'
ORDER BY 1,2;

-- Total Cases vs Population
SELECT location,date,population,total_cases,(total_cases/population)*100 AS deathpercentage
FROM covid_deaths
WHERE location = 'United States'
ORDER BY 1,2;

-- Countries with hightest Infection Rate compared to Population
SELECT location,population, MAX(total_deaths) as highest_death
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location,population
ORDER BY highest_death desc;

-- Continents with hightest Infection Rate compared to Population
SELECT location, MAX(total_deaths) as TotalDeathCount
FROM covid_deaths
WHERE continent IS NULL
GROUP BY location
ORDER BY TotalDeathCount desc;

-- Global numbers by Date
SELECT date,SUM(new_cases) AS new_cases_per_day,SUM(total_deaths) AS new_deaths_per_day
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;

-- Worldwide number of cases and deaths
SELECT SUM(total_cases) AS total_cases,SUM(total_deaths) AS total_deaths,(SUM(total_deaths)/SUM(total_cases))*100 AS percentage_death_to_all_cases
FROM covid_deaths
WHERE continent IS NOT NULL;


----------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM covid_vaccinations;

-- New vaccinations in Germany
SELECT covid_deaths.continent,covid_deaths.location,covid_deaths.date,population,new_vaccinations FROM covid_deaths
JOIN covid_vaccinations
ON covid_deaths.location = covid_vaccinations.location AND covid_deaths.date = covid_vaccinations.date
WHERE covid_deaths.continent IS NOT NULL AND covid_deaths.location = 'Germany'
ORDER BY location, date;










