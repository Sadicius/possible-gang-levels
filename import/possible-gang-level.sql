CREATE TABLE gangs (
    gang_name VARCHAR(255) PRIMARY KEY,
    gang_level INT DEFAULT 1,
    gang_xp INT DEFAULT 0,
    UNIQUE(gang_name)
);
