select *
from Data_Analysis..Covid_Deaths$
order by 1,2

--Total Death Vs Total Cases in Africa
select location, date, total_cases, total_deaths, (CONVERT(float, total_deaths) / NULLIF(CONVERT(float, total_cases), 0)) * 100 AS Deathpercentage
from Data_Analysis..Covid_Deaths$
where location like '%Africa%'
order by 1,2

--Total cases vs population
select location, date, total_cases, total_deaths, population, (CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0)) * 100 AS PercentPopulationInfected 
from Data_Analysis..Covid_Deaths$
where location like '%Africa%'
order by 1,2

--Highest infection rate 

select location, date, max(total_cases) as highestInfectionCount, population, max((CONVERT(float, total_cases) / NULLIF(CONVERT(float, population), 0))) * 100
AS PercentPopulationInfected
from Data_Analysis..Covid_Deaths$
group by location, population, date
order by PercentPopulationInfected desc

--Highest Death Count Per Population

select location, max(cast(total_deaths as int)) as TotalDeathCount
from Data_Analysis..Covid_Deaths$
where continent is not null
group by location
order by TotalDeathCount desc

-- By Continent 
select continent, max(cast(total_deaths as int)) as TotalDeathCount
from Data_Analysis..Covid_Deaths$
where continent is not null
group by continent
order by TotalDeathCount desc

-- lets's break things death count per population

select continent, max(cast(total_deaths as int)) as TotalDeathCount
from Data_Analysis..Covid_Deaths$
where continent is not null
group by continent
order by TotalDeathCount desc

--Global Number

select date, sum(new_cases) as total_cases, sum(cast(new_deaths as float)) as total_deaths, (CONVERT(float, new_deaths) / NULLIF(CONVERT(float, new_cases), 0)) * 100 
as DeathPercentage
from Data_Analysis..Covid_Deaths$
where continent is not null
group by date, new_deaths, new_cases
order by 1,2



