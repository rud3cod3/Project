## Architecture

 ┌────────────────────────┐
 │        HOST PC         │
 │  (Browser / curl)      │
 └────────────┬───────────┘
              │  (Port Forwarding)
 ┌────────────┴────────────┐
 │   Ubuntu VM3 (Docker)   │
 │  ├──────────────────┐   │
 │  │ Container 1 (Nginx)│ → Site 1 → Port 8091
 │  │ Container 2 (Nginx)│ → Site 2 → Port 8092
 │  └──────────────────┘   │
 └─────────────────────────┘

