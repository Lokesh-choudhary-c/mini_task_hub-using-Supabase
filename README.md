# Task hub Flutter App

Task hub is a minimal and beautiful task management app built using **Flutter**, **Supabase**, and **Riverpod**. It allows users to sign up, log in, manage their tasks, chat, view a schedule, and toggle between light and dark themes.

---

##  Setup Instructions

1. **Clone the repository**  
   ```bash
   git clone https://github.com/Lokesh-choudhary-c/mini_task_hub-using-Supabase
   cd daytask



##  Supabase Setup Steps


1. Create a Project
Visit supabase website
Create a new project
Copy the Project URL and Anon Key from the project settings

2. Enable Email Authentication
Go to Authentication → Settings → Email
Enable email login

3. Create tasks Table
create table tasks (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references auth.users(id) on delete cascade,
  title text,
  is_completed boolean default false,
  created_at timestamp default now()
);

4. Add Supabase to Your App
await Supabase.initialize(
  url: 'supabase url',
  anonKey: 'anonkey',
);


##  Hot Reload vs Hot Restart

Hot Reload
 Hot Reload is very fast, keeps the state and we can make UI/UX changes easily

Hot Restart
 it is very slow and compiles the whole code from beginning. 
