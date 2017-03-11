# MVP
## Keeping it simple
I have large ideas for what this could be. But for now, going to keep it simple and basic. The main goal is so my wife doesn't have to use a spreadsheet to make a schedule. Going to make that happen, then potentially build on it from there.

## Things to do
- [ ] Create single user with an email and password
- [ ] Create 52 weekly schedules with days and dates for 2017
- [ ] Create shifts for manager, team members, and shift leads
- [ ] Create employees

## Admin model
- `email`, `password`, `position`
- Associations
  - `has_many :employees`
  - `has_many :schedules`
  - `has_many :admin_shifts`
  - `has_many :shifts, through: admin_shifts`

## Employee model
- `name`, `position`
- Associations
  - `belongs_to :admin`
  - `has_many :employee_shifts`
  - `has_many :shifts, through: employee_shifts`
- method  `shift_leads` to grab all employees who are a shift lead
- method  `team_member` to grab all employees who are a team member

## Schedule model
  - `biz_year`, `biz_week`
  - Associations
    - `belongs_to :admin`
    - `has_many :schedule_shifts`
    - `has_many: :shifts, through: schedule_shifts`

## Shift model
- `day_of_week`, `start_time`, `end_time`, `position`
- method `sundays` to grab all Sunday shifts
- method `shift_leads` to grab `shifts.position == "shift_lead"`
- Associations
  - `has_many :admin_shifts`
  - `has_many :admins, through: admin_shifts`
  - `has_many :employee_shifts`
  - `has_many :employees, through: employee_shifts`
  - `has_many :schedule_shifts`
  - `has_many: :schedules, through: schedule_shifts`

## Admin_shifts model
- Associations
  - `belongs_to :admin`
  - `belongs_to :shift`

## Employee_shifts model
- Associations
  - `belongs_to :employee`
  - `belongs_to :shift`

## Schedule_shifts model
- Associations
  - `belongs_to :schedule`
  - `belongs_to :shift`

# What it could be
## General idea of app structure
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
- The organizer, admins, managers, or assistants can finalize the schedule and download it as a PDF (ideally email to all employees on the team).

## Models
I think the way I want to do this is have the Devise user model, then using single table inheritance (STI) for the other user roles. Probably the best way with the associations I want each type of user to have. I will have the Devise `User` model and each of the "roles" will be models that inherite from `User` i.e. `Organizer < User`. [Reference](https://rails.devcamp.com/professional-rails-development-course/advanced-user-features/enabling-admin-users-using-single-table-inheritance)

The gem devise_invitable will allow users to invite. The user will have a `role_id` or `type` (see above reference link, `type` should work just as well as `role_id` for the invite) column that will be part of the invite and like the invited email, get set in the sign up form. [Reference](http://stackoverflow.com/questions/29616495/cannot-get-devise-invitable-to-assign-a-role-when-inviting)

Form example:
```
<%= simple_form_for(User.new, url: user_invitation_path,
                              html: { class: 'form-inline' }) do |f| %>
  <%= f.input :email, placeholder: 'Email', label: false %>
  <%= f.collection_select :role_id, Role.all, :id, :name, {} %>
  <%= f.button :submit, 'Invite User', class: 'btn-primary' %>
<% end %>
```

- User
  - Models that inherit from `User` will act as roles: organizer, admin, manager, assistant (find better term than assistant), employee
  - `first_name:string`, `last_name:string`, `email:string`, `title:string`, `role_id:integer` (or `type:string`)
  - Associations
    - `belongs_to :organization`
    - `belongs_to :team`
    - `has_many :user_schedules`
    - `has_many :schedules, through: :user_schedules`

- Role
  - I don't think this is necessary if I use `type`

- Organization
  - `name:string`, `email:string`
  - Associations
    - `has_many :teams`
    - `has_many :admins`, `has_many :managers`, `has_many :assistants`,      `has_many :employees`

- Team
  - `location:string`
  - Associations
    - `belongs_to :organization`
    - `has_many :schedules`
    - `has_many :users`

- UserSchedules
  - Associations
  - `belongs_to :user`
  - `belongs_to :schedule`

- Schedule
  - `year:integer`, `week:integer`, `date_range:string #don't call it that`
  - Associations
    - `belongs_to :team`
    - `has_many :user_schedules`
    - `has_many :users, through: :user_schedules`
    - `has_many :schedule_shifts`
    - `has_many :shifts, through: :schedule_shifts`

- ScheduleShifts
  - Associations
    - `belongs_to :schedule`
    - `belongs_to :shift`

- Shift
  - `day:string #don't all it that`, `start_time:time`, `end_time:time`, `role:string`
  - Associations
    - `has_many :schedule_shifts`
    - `has_many :schedules, through: :schedule_shifts`

### Who gets to do what
#### Adding users
```
Cascading permissions
├─ Organizer can create/invite admins
|  └─ Admins can create/invite managers
|   └─ Managers can create/invite assistants
|     └─ Managers can create/invite employees
└─ Once invited, any user can create their account
```

#### Default user role
- When you create an organization, your account is also created and your role is defaulted to organizer.
- When you click an invite link, your role is defaulted to the role selected when your invite was created.
- You are not allowed to invite users with a higher role than you have.

#### Removing users
```
Cascading permissions
└─ Organizer can remove admins
  └─ Admins can remove managers
    └─ Managers can remove assistants
      └─ Managers can remove employees
       └─ An employee cannot remove their account
```

## Controllers
- Users
- Sessions
- Schedules
- Shifts
- Teams
- Organizations
- Welcome

## Views
- Home page
- Organization sign up page
  - Sign up page for if you have an invite code
- Invite page (selects for admin, manager, assistant, employee)
- Account page for each user type
- Team creation page
  - Team show page
- Shift creation page
  - Shifts show page
- Schedule creation page
  - Schedule show page
