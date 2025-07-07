CREATE TABLE IF NOT EXISTS tip (
    id SERIAL PRIMARY KEY,
    level VARCHAR(20),
    message TEXT
);

INSERT INTO tip (level, message) VALUES
('low', 'Keep up the good work, maintain balance'),
('medium', 'Watch your diet and monitor daily'),
('high', 'Consult your doctor as soon as possible');
