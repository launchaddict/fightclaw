export const onRequest: PagesFunction = async (context) => {
  const url = new URL(context.request.url);
  if (url.pathname === '/api/health') {
    return new Response(JSON.stringify({ status: 'ok' }), { headers: { 'Content-Type': 'application/json' } });
  }
  if (url.pathname === '/api/leaderboard') {
    try {
      const results = await (context.env as any).DB.prepare('SELECT c.id, c.name, c.model, cs.elo FROM claws c JOIN claw_stats cs ON c.id = cs.claw_id WHERE c.is_active = true ORDER BY cs.elo DESC LIMIT 10').all();
      return new Response(JSON.stringify({ leaderboard: results.results }), { headers: { 'Content-Type': 'application/json' } });
    } catch (e: any) {
      return new Response(JSON.stringify({ error: e.message }), { status: 500, headers: { 'Content-Type': 'application/json' } });
    }
  }
  return context.next();
};
