# General idea of app structure
- An organizer can create an account for their company.
- The organizer can assign admins.
- The organizer or admins can assign managers.
- The organizer or admins can create a team.
- The organizer, admins, or managers can assign employees to their team.
- The organizer, admins, or managers can assign assistants to their team.
- The organizer, admins, or managers can create shifts for their team.
- The organizer, admins, managers, or assistants can update the employee's availability based on created shifts for their team.
- The organizer, admins, managers, or assistants can schedule an employee for a shift.
- The organizer, admins, managers, or assistants cannot schedule an employee for a shift the employee is not available for.
- The organizer, admins, managers, or assistants can finalize the schedule and download it as a PDF.

# Models
- User
  - first name, last name, email
  - roles: organizer, admin, manager, assistant, employee
  - has_one :organization

- Organization

- Team

- Schedule

- Week

- Shift

## Who gets to do what
### Adding users
```
Cascading permissions
├─ Organizer can create/invite admins
|  └─ Admins can create/invite managers
|   └─ Managers can create/invite assistants
|     └─ Managers can create/invite employees
└─ Once invited, any user can create their account
```

### Default user role
- When you create an organization, your account is also created and your role is defaulted to organizer.
- When you click an invite link, your role is defaulted to the role selected when your invite was created.
- You are not allowed to invite users with a higher role than you have.

### Removing users
```
Cascading permissions
└─ Organizer can remove admins
  └─ Admins can remove managers
    └─ Managers can remove assistants
      └─ Managers can remove employees
       └─ An employee cannot remove their account
```

# Controllers

# Views
