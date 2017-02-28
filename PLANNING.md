## Models
User
  first_name, last_name, email
  roles: organizer, admin, manager, assistant, employee
  has_one :organization

Organization

Team

Schedule

Week

Shift


├─ Organizer can create/invite admins
  └─ Admins can create/invite managers
    └─ Managers can create/invite assistants
      └─ Managers can create/invite employees
