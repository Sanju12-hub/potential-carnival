--select * 
--from portfolioproject1.coviddeaths
--order by 3,4

--select  location,date,total_cases,new_cases,population
--from portfolioproject1.coviddeaths
--order by 1,2

--select  location,date,total_cases,new_cases, (total_deaths/total_cases)*100 as DeathPercentage
--from portfolioproject1.coviddeaths
--order by 1,2

--select  location,date,total_cases,new_cases, (total_deaths/total_cases)*100 as DeathPercentage
from portfolioproject1.coviddeaths
where location like '%stan%'
order by 1,2

--select  location,date,total_cases,new_cases,population, (total_cases/population)*100 as DeathPercentage
from portfolioproject1.coviddeaths
where location like '%a%'
order by 1,2
--highest infected countries

--select  Location,Populaion, Max(total_cases) as highestInfecton, MAX((total_cases/population))*100 as Percentageinfected
from portfolioproject1..coviddeaths
group by population , locaion

--select location,population, total_cases, MAX((total_deaths/population))*100 as Percentagedeath
from portfolioproject1 .coviddeaths
group by population , location

--select location,Max(total_deaths) as highDeaths , Max(total_cases) as highCases
from portfolioproject1 .coviddeaths
group by location`covid vaccine`coviddeaths

--select location,Max(total_deaths) as highDeaths , Max(total_cases) as highCases
from portfolioproject1 .coviddeaths
where continent is not null
--where location like '%states%'
group by location
--order by highDeaths desc
--lets divide by continent

--select continent, Max(total_deaths ) as highDeathscount
from portfolioproject1 .coviddeaths
where continent is not null
group by continent
order by highDeathscount desc


--select continent
from portfolioproject1 .coviddeaths
where continent is not null

--Global no.

--select location,date,total_cases,new_cases, (total_deaths/total_cases)*100 as DeathPercentage
from portfolioproject1 .coviddeaths
where continent is not null
group by date
order by 1,2


--select location,date,sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total deaths , sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from portfolioproject1 .coviddeaths
where continent is not null
order by 1,2

insert into #perecntpopulationvaccinated
select dea.continent,dea.location,dea.date,vac.new_vaccinations,sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by
dea.loaction,dea.date) as RollingPeopleVaccinted
from portfolioproject1 .coviddeaths dea
join portfolioproject1 .covid vaccine vac
    on dea.location = vac.loaction
    and dea.date = vac.date
where continent is not null  
order by 2,3

create table #perecntpopulationvaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccinted numeric,
)

--select * 
from #perecntpopulationvaccinated

--creating view to store data for later visualizatin
insert into #perecntpopulationvaccinated

create view perecntpopulationvaccinated as
select dea.continent,dea.location,dea.date,vac.new_vaccinations,sum(convert(int,vac.new_vaccinations)) over (partition by dea.location order by
dea.loaction,dea.date) as RollingPeopleVaccinted
from portfolioproject1 .coviddeaths  dea
join portfolioproject1 .covid vaccine  vac
    on dea.location = vac.loaction
    and dea.date = vac.date
where continent is not null  
--order by 2,3
