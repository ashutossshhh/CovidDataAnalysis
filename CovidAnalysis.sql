--The total cases grouped by all the continents.

select [continent], SUM([total_cases]) as Total_Cases from [dbo].[CovidDeaths$]
where continent is not null
group by [continent]
order by Total_Cases desc

--Change the data type of column total_deaths.

alter table [dbo].[CovidDeaths$] alter column [total_deaths] int

--The total deaths grouped by all the continents.

select [continent], SUM([total_deaths]) as Total_Deaths from [dbo].[CovidDeaths$]
where continent is not null
group by [continent]
order by Total_Deaths desc

--Countries with most lives lost

SELECT top 5 [location],
       SUM([total_deaths]) AS Total_Deaths
FROM [dbo].[CovidDeaths$]
WHERE [location] IS NOT NULL AND [location] <> 'World' AND [continent] IS NOT NULL
GROUP BY [location]
ORDER BY Total_Deaths DESC;

alter table [dbo].[CovidDeaths$] alter column [icu_patients] int

--ICU Patients Globally

select SUM([icu_patients]) as Total_ICU_Patients from [dbo].[CovidDeaths$]


--ICU Patients by Locations

select top 5 [location], SUM([icu_patients]) as Total_ICU_Patients from [dbo].[CovidDeaths$]
group by location
order by Total_ICU_Patients desc;



alter table [dbo].[CovidDeaths$] alter column [total_tests] bigint

--Total No. of Test Conducted in Each Country

SELECT TOP 10 [location], SUM([total_tests]) as Total_Tests
FROM [dbo].[CovidDeaths$]
GROUP BY [location]
ORDER BY Total_Tests DESC;

alter table [dbo].[CovidDeaths$] alter column [total_vaccinations_per_hundred] float

alter table [dbo].[CovidDeaths$] alter column [total_vaccinations] bigint

--Calculate the percentage of the population that has been vaccinated in different countries

