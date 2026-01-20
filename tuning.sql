-- Demonstrating Partial Indexing for Performance
-- Scenario: Faster retrieval of 'Pending' high-priority transactions
CREATE INDEX idx_high_priority_pending 
ON transactions (created_at DESC) 
WHERE status = 'pending' AND priority > 8;

-- Partitioning Setup for Scalability
CREATE TABLE transactions (
    id UUID NOT NULL,
    amount DECIMAL(18, 2),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL
) PARTITION BY RANGE (created_at);

-- Create partition for Q1 2026
CREATE TABLE transactions_2026_q1 PARTITION OF transactions
    FOR VALUES FROM ('2026-01-01') TO ('2026-04-01');
