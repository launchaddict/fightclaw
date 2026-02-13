-- Claw registry (people's OpenClaw configs)
CREATE TABLE IF NOT EXISTS claws (
  id TEXT PRIMARY KEY,
  owner_contact TEXT NOT NULL,  -- Telegram handle, Discord, etc.
  owner_name TEXT,
  name TEXT NOT NULL,           -- "ShadowClaw", "GPT-Boss", etc.
  model TEXT NOT NULL,          -- zai/glm-4.7, claude-3.5-sonnet, etc.
  system_prompt TEXT NOT NULL,
  temperature REAL DEFAULT 0.7,
  max_tokens INTEGER DEFAULT 1000,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  last_battled_at DATETIME,
  is_active BOOLEAN DEFAULT true
);

-- Battle categories
CREATE TABLE IF NOT EXISTS categories (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,           -- "Creative", "Technical", "Funny"
  description TEXT,
  emoji TEXT                     -- 🎨, 💻, 😂
);

-- Battles
CREATE TABLE IF NOT EXISTS battles (
  id TEXT PRIMARY KEY,
  category_id TEXT NOT NULL,
  claw_a_id TEXT NOT NULL,
  claw_b_id TEXT NOT NULL,
  prompt TEXT NOT NULL,
  response_a TEXT NOT NULL,
  response_b TEXT NOT NULL,
  status TEXT DEFAULT 'active', -- active, completed
  winner_id TEXT,                -- claw_id of winner, or NULL for tie
  votes_a INTEGER DEFAULT 0,
  votes_b INTEGER DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  completed_at DATETIME,
  FOREIGN KEY (claw_a_id) REFERENCES claws(id),
  FOREIGN KEY (claw_b_id) REFERENCES claws(id),
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (winner_id) REFERENCES claws(id)
);

-- Claw stats (ELO ratings)
CREATE TABLE IF NOT EXISTS claw_stats (
  claw_id TEXT PRIMARY KEY,
  elo INTEGER DEFAULT 1000,
  wins INTEGER DEFAULT 0,
  losses INTEGER DEFAULT 0,
  ties INTEGER DEFAULT 0,
  current_streak INTEGER DEFAULT 0,
  longest_streak INTEGER DEFAULT 0,
  total_battles INTEGER DEFAULT 0,
  last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (claw_id) REFERENCES claws(id)
);

-- Votes
CREATE TABLE IF NOT EXISTS votes (
  id TEXT PRIMARY KEY,
  battle_id TEXT NOT NULL,
  voter_id TEXT NOT NULL,       -- Telegram user_id, etc.
  vote TEXT NOT NULL,           -- 'a' or 'b'
  voted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (battle_id) REFERENCES battles(id),
  UNIQUE(battle_id, voter_id)   -- One vote per battle per voter
);

-- Seed categories
INSERT INTO categories (id, name, description, emoji) VALUES
  ('creative', 'Creative', 'Stories, poems, dialogue, artistic expression', '🎨'),
  ('technical', 'Technical', 'Code, debugging, architecture, explanations', '💻'),
  ('funny', 'Funny', 'Jokes, roasts, witty comebacks, humor', '😂'),
  ('strategy', 'Strategy', 'Business advice, problem-solving, tactics', '🧠'),
  ('free-for-all', 'Free-for-All', 'Anything goes', '⚔️');

-- Indexes for performance
CREATE INDEX IF NOT EXISTS idx_claws_active ON claws(is_active, last_battled_at);
CREATE INDEX IF NOT EXISTS idx_battles_status ON battles(status, created_at);
CREATE INDEX IF NOT EXISTS idx_battles_category ON battles(category_id, status);
CREATE INDEX IF NOT EXISTS idx_claw_stats_elo ON claw_stats(elo DESC);
