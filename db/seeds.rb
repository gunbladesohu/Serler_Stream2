# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ArticlesResearchMethod.destroy_all
ArticlesResearchParticipant.destroy_all
DevMethod.destroy_all
Methodology.destroy_all
ResearchMethod.destroy_all
Status.destroy_all
Role.destroy_all
ResearchParticipant.destroy_all
ArticleUser.destroy_all
Article.destroy_all
User.destroy_all
Rating.destroy_all




DevMethod.create(name: 'Test Driven Development',      description: '', is_active: true)
DevMethod.create(name: 'Behaviour Driven Development', description: '', is_active: true)
DevMethod.create(name: 'Pair programming',             description: '', is_active: true)
DevMethod.create(name: 'Planning poker',               description: '', is_active: true)
DevMethod.create(name: 'Daily standup meetings',       description: '', is_active: true)
DevMethod.create(name: 'Story board',                  description: '', is_active: true)
DevMethod.create(name: 'User story mapping',           description: '', is_active: true)
DevMethod.create(name: 'Continuous integration',       description: '', is_active: true)
DevMethod.create(name: 'Retrospective',                description: '', is_active: true)
DevMethod.create(name: 'Burn down charts',             description: '', is_active: true)
DevMethod.create(name: 'Requirements prioritisations', description: '', is_active: true)
DevMethod.create(name: 'Version control',              description: '', is_active: true)
DevMethod.create(name: 'Code sharing',                 description: '', is_active: true)

Methodology.create(name: 'Spiral',                      description: '', is_active: true)
Methodology.create(name: 'XP',                          description: '', is_active: true)
Methodology.create(name: 'Rational Unified Process',    description: '', is_active: true)
Methodology.create(name: 'Crystal',                     description: '', is_active: true)
Methodology.create(name: 'Clean room',                  description: '', is_active: true)
Methodology.create(name: 'Feature Driven Development',  description: '', is_active: true)
Methodology.create(name: 'Model Driven Development',    description: '', is_active: true)
Methodology.create(name: 'Problem Driven Development',  description: '', is_active: true)
Methodology.create(name: 'Formal methods',              description: '', is_active: true)
Methodology.create(name: 'Cloud computing',             description: '', is_active: true)
Methodology.create(name: 'Service Oriented Development',description: '', is_active: true)
Methodology.create(name: 'Aspect Oriented Development', description: '', is_active: true)
Methodology.create(name: 'Value Driven Development',    description: '', is_active: true)
Methodology.create(name: 'Product Driven Development',  description: '', is_active: true)
Methodology.create(name: 'Agile',                       description: '', is_active: true)

research_method1 = ResearchMethod.create(name: 'Case study',        description: '', is_active: true)
research_method2 = ResearchMethod.create(name: 'Field Observation', description: '', is_active: true)
research_method3 = ResearchMethod.create(name: 'Experiment',        description: '', is_active: true)
research_method4 = ResearchMethod.create(name: 'Interview',         description: '', is_active: true)
research_method5 = ResearchMethod.create(name: 'Survey',            description: '', is_active: true)

Status.create(name: 'To be moderated',   description: '', is_active: true)
Status.create(name: 'Accepted',          description: '', is_active: true)
Status.create(name: 'Rejected',          description: '', is_active: true)
Status.create(name: 'Analysis complete', description: '', is_active: true)

role1 = Role.create(name: 'Admin',                    description: '', is_active: true)
Role.create(name: 'Moderator',                description: '', is_active: true)
Role.create(name: 'Analyst',                  description: '', is_active: true)
Role.create(name: 'User',                     description: '', is_active: true)
Role.create(name: 'Member of SDM class',      description: '', is_active: true)

participant1 = ResearchParticipant.create(name: 'Undergraduate students', description: '', is_active: true)
participant2 = ResearchParticipant.create(name: 'Postgraduate students',  description: '', is_active: true)
participant3 = ResearchParticipant.create(name: 'Practitioners',          description: '', is_active: true)

default_password = "admin123"

user1 = User.create!(first_name: '1',   middle_name: '1', email: 'paul@serler.com',
password_digest: default_password, roles: [role1] )
user2 = User.create!(first_name: '2',   middle_name: '2', email: 'ss@s.com',
password_digest: default_password )
user3 = User.create!(first_name: '3',   middle_name: '3', email: 'dd@d.com',
password_digest: default_password )

Article.create(title: 'Future Research Directions of Software Engineering and Knowledge Engineering',   journal: 'International Journal of Software Engineering & Knowledge Engineering', users: [user1],
  year: 2015, volume: 25, number: 2, month: 03, pages: '4-5',
  research_participants: [participant1], research_methods: [research_method1, research_method2])
Article.create(title: 'Social Exchange Model between Human Resource Management Practices and Innovation in Software Engineering',
  journal: 'Seoul Journal of Business', users: [user1],
  year: 2014, volume: 20, number: 2, month: 12, pages: '49-69',
  research_participants: [participant2], research_methods: [research_method1])
Article.create(title: 'Java1',   journal: 'good', users: [user2],
  year: 1999, volume: 123, number: 321, month: 10, pages: 23,
  research_participants: [participant3], research_methods: [research_method1])
Article.create(title: 'Java2',   journal: 'good', users: [user2],
  year: 1999, volume: 123, number: 321, month: 10, pages: 23,
  research_participants: [participant3], research_methods: [research_method1])
Article.create(title: 'Java3',   journal: 'good', users: [user2],
  year: 1999, volume: 123, number: 321, month: 10, pages: 23,
  research_participants: [participant1], research_methods: [research_method1, research_method2])
Article.create(title: 'Integrating software engineering theory and practice using essence: A case study',
  journal: 'Towards general theories of software engineering, Science of Computer Programming',
  users: [user1], year: 2015, month: 4, volume: 101, pages: '66-78',
  research_participants: [participant1], research_methods: [research_method1, research_method2])
Article.create(title: 'Rails',  journal: 'good', users: [user2], year: '2015',month: 'April', volume: '47', number: '3',
  research_participants: [participant2], research_methods: [research_method1])
Article.create(title: 'Java',   journal: 'good', users: [user3], year: '2000',month: 'June', volume: '47', number: '3',
  research_participants: [participant3], research_methods: [research_method1])
