-- teams
CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255),
    coach_name VARCHAR(255),
    city VARCHAR(255)
);

-- players
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    player_name VARCHAR(255),
    team_id INT,
    date_of_birth DATE,
    position VARCHAR(255),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- goals
CREATE TABLE Goals (
    goal_id INT PRIMARY KEY,
    player_id INT,
    match_id INT,
    goal_minute INT,
    FOREIGN KEY (player_id) REFERENCES Players(player_id),
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);

-- referees
CREATE TABLE Referees (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(255)
);

-- matches
CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date DATE,
    referee_id INT,
    home_team_score INT,
    away_team_score INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (referee_id) REFERENCES Referees(referee_id)
);

-- seasons
CREATE TABLE Seasons (
    season_id INT PRIMARY KEY,
    season_name VARCHAR(255),
    start_date DATE,
    end_date DATE
);

-- standings 
CREATE TABLE TeamStandings (
    standing_id INT PRIMARY KEY,
    team_id INT,
    season_id INT,
    points INT,
    wins INT,
    draws INT,
    losses INT,
    goals_for INT,
    goals_against INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (season_id) REFERENCES Seasons(season_id)
);

