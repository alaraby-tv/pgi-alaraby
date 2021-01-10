# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = Role.create([
  { name: "superuser",
    can_invite_new_user: true,
    can_create_product: true,
    can_view_all_products: true },
  { name: "producer" }
])

users = User.create([
  { role: roles.first, 
    first_name: "Przemyslaw", 
    last_name: "Markowski", 
    email: "pmarkowski@alaraby.tv", 
    admin: true, 
    password: ENV["email_password"],
    password_confirmation: ENV["email_password"],
    invitation_accepted_at: Time.now }
])

attachment_emails = AttachmentEmail.create([
  { email: users.first.email,
    on_creation: true,
    on_delete: true }
])

product_emails = ProductEmail.create([
  { email: users.first.email,
    on_creation: true,
    on_update: true }
])

episode_emails = EpisodeEmail.create([
  { email: users.first.email,
    on_creation: true,
    on_update: true }
])

presenters = Presenter.create([
  { name: "Amal Arab" },
  { name: "Badr Sayarah" },
  { name: "Najlaa Aboumerhi" },
  { name: "Wael Tamimi" },
  { name: "Lilian Daoud" },
  { name: "Rima Chlone" },
  { name: "Tamer Abouarab" },
  { name: "Salma Aldaly" },
  { name: "Farah Barkawi" },
  { name: "Jamal Ezzedini" },
  { name: "Majed Zeyarah" },
  { name: "Sarmad Akram" },
  { name: "Nidal Hamdi" },
  { name: "Dima Wanous" },
  { name: "Nadine Mourad" },
  { name: "Rowaida Abo Eid" },
  { name: "Rola Haidar" },
  { name: "Ahmad Agha" },
  { name: "Kamal Allouani" },
  { name: "Zaher Omareen" }
])

product_types = ProductType.create([
  { sort: "Single product" },
  { sort: "Multi episode product" }
])

material_types = MaterialType.create([
  { name: "video" },
  { name: "audio" },
  { name: "document" },
  { name: "image" }
])

natures = Nature.create([
  { name: "Acquired" }, 
  { name: "Commissioned" },
  { name: "Coproduction" },
  { name: "Foreign" },
  { name: "Live" },
  { name: "Recorded" }
])

categories = Category.create([
  { name: "Movie" }, 
  { name: "Documentary" },
  { name: "Semi Documentary" },
  { name: "News" },
  { name: "Live" },
  { name: "Fillers" },
  { name: "Weather" },
  { name: "Public Announcement" },
  { name: "Music" },
  { name: "Play" },
  { name: "Drama Series" },
  { name: "Programme" }
])
 
genres = Genre.create([
  { name: "Political" }, 
  { name: "Current Affairs" },
  { name: "Fiction" },
  { name: "Entertainment" },
  { name: "Sports" },
  { name: "Factual" },
  { name: "Drama" },
  { name: "Music" },
  { name: "Cultural" }
])


broadcast_mediums = BroadcastMedium.create([
  { name: "Alaraby 1" },
  { name: "Alaraby 2" },
  { name: "Social Media" }
])

departments = Department.create([
  { name: "Acquisitions" },
  { name: "Commercials" },
  { name: "Creative" },
  { name: "News" },
  { name: "News programmes" },
  { name: "Variety programmes" }
])

ages = Age.create([
  { range: "15-24" },
  { range: "25-34" },
  { range: "35-44" },
  { range: "45-54" },
  { range: "55+" }
])

educations = Education.create([
  { level: "No schooling completed" },
  { level: "Primary school" },
  { level: "High school" },
  { level: "College" },
  { level: "Master's degree" },
  { level: "Doctorate degree" }
])

genders = Gender.create([
  { identity: "Male" },
  { identity: "Female" }
])

regions = Region.create([
  { name: "Levant" },
  { name: "GCC" },
  { name: "Egypt" },
  { name: "North Africa" },
  { name: "MENA" },
  { name: "Global" }
])

broadcasting_freequencies = BroadcastingFrequency.create([
  { regularity: "daily" },
  { regularity: "weekly" },
  { regularity: "fortnightly" },
  { regularity: "monthly" },
  { regularity: "weekdays" },
  { regularity: "weekends"}
])

durations = Duration.create([
  { length_in_minutes: 5 },
  { length_in_minutes: 26 },
  { length_in_minutes: 52 }
])

production_companies = ProductionCompany.create([
  { name: "03 Productions" },
  { name: "20th Century Fox (Teleprog)" },
  { name: "3Boxmedia ARTE" },
  { name: "ARTRIP Productions" },
  { name: "ART" },
  { name: "ATA Animation Studio" },
  { name: "ATN" },
  { name: "Afro Med New Ltd" },
  { name: "Aladl Group" },
  { name: "Albatross World Sales" },
  { name: "Alfenjan" },
  { name: "Aliaa Khachouk" },
  { name: "Aljazeera" },
  { name: "Aljeel Medya" },
  { name: "Alrihla" },
  { name: "AmplifiedMedia" },
  { name: "Andana Films" },
  { name: "Anwar al-Raziqy" },
  { name: "Arab Media" },
  { name: "Artwork Productions - Tawasheeh" },
  { name: "Atlas Euro Teknik Medya" },
  { name: "BBC" },
  { name: "Bahrain Film Production" },
  { name: "CAT & Docs" },
  { name: "CPT Holdings - Sony Pictures" },
  { name: "Circle" },
  { name: "DOCANDFILM" },
  { name: "DR" },
  { name: "DRG" },
  { name: "DW" },
  { name: "Domino Film" },
  { name: "E-spaces" },
  { name: "EdithParis" },
  { name: "Elmarwa" },
  { name: "Espresso Media International" },
  { name: "Firas Diba" },
  { name: "Founoon Film Distribution" },
  { name: "H24" },
  { name: "Handmade Studios" },
  { name: "Ismael Hamdy" },
  { name: "Journey Pictures Limited" },
  { name: "Journeyman" },
  { name: "Lais Art Production and Distribution" },
  { name: "Lumiere Films" },
  { name: "MAGNETFILM" },
  { name: "MC Distribution" },
  { name: "MGR" },
  { name: "Mashahid for Art Production" },
  { name: "Masr International" },
  { name: "Media Link International" },
  { name: "Media Twist FZE" },
  { name: "Metafora" },
  { name: "NA" },
  { name: "NATIONAL FILM BOARD OF CANADA" },
  { name: "NBC" },
  { name: "O2 Media Group" },
  { name: "OFF The Fence B.V" },
  { name: "Pete Samuel" },
  { name: "Presentation Media" },
  { name: "Qubba Ltd" },
  { name: "Rasha Najeh" },
  { name: "SAWA MEDIA JLT" },
  { name: "Scorpion TV" },
  { name: "Shabuna Alalamiya" },
  { name: "Sideways Film" },
  { name: "Spier Films Ltd" },
  { name: "Sunnyland (ART Aflam)" },
  { name: "Teleprog" },
  { name: "Terranoa" },
  { name: "UAEFD" },
  { name: "UAEFD - Arabic films" },
  { name: "VIMEO" },
  { name: "Wasfi Eltal str." },
  { name: "Wojooh Arabia" },
  { name: "Yasmine Media" },
  { name: "ZED" }
])






 






