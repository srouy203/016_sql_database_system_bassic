					Lesson 4															Entity Relationship (ER) Modeling

\THE ENTITY RELATIONSHIP MODEL (ERM)

	ENTITIES: ត្រូវបានគេគូសទុកក្នុងប្រអប់ចតុកោណកែងដោយសរសេឈ្មោះរបស់វានៅក្នុងប្រអប់ ហើយឈ្មោះ entity នេះឯងជានាម។ 
					  ជាព័ត៌មានគ្រប់យ៉ាង បើទោះជាយើងមើលមិនឃើញក៏ដោយ អោយតែយើងចង់រក្សាទុកវាជា intity។

	Problem 1 - JCBC()
	Jonesburgh County Basketball Conference (JCBC) គឺជាសមាគមកីឡាបាល់បោះស្ម័គ្រចិត្តមួយ។ ទីក្រុងនីមួយៗក្នុងប្រទេសមានក្រុមកីឡាបាល់បោះមួយជាតំណាង។
	ក្រុមកីឡាបាល់បោះនីមួយៗមានកីឡាករច្រើនបំផុតដប់ពីរនាក់ និងតិចបំផុតប្រាំបួននាក់។
	ក្រុមកីឡាបាល់បោះនីមួយៗមានគ្រូច្រើនបំផុតបីនាក់ (វាយលុក, ការពារ, កម្លាំង)។
	ក្នុងរដូវកាល ក្រុមកីឡាបាលើបោះនីមួយៗប្រកួតពីរដង (ក្នុងផ្ទះ និងក្រៅផ្ទះ)។
		ចូរកំណត់ entities សំខាន់ៗ (Entity ក្នុង ERM និង ERD មានន័យដៅទៅ តារាង-Table)។
	The jonesburgh County Basketball Conference (JCBC) is an amateur basketball association.
	Each city in the country has one team as its representative.
	Each team has a maximum of 12 players and a minimum if 9 players.
	Each team also has up to three coaches (offensive, defensive, and physical training coaches).
	During the season, each team plays two games (home and visitor) against each of the other team.
		Identify  the main entities.
	

ATTRIBUTES
	ATTRIBUTES:
			Required attribute: ជាជួរឈដែលចាំបាច់ត្រូវមានតម្លៃជានិច្ច។
			Optional attribute: ជាជួរឈដែលតម្លៃរបស់វាជួនមានជួនអត់។
			Composite identifier: ជា Primary key ដែលកើតឡើងរវាងជួរឈពីរ
			Composite attribute: ជាជួរឈដែលតម្លៃរបស់វាអាចចែកជាច្រើនចំណែកបាន បើចាំបាច់។ (Name, Date, Address, Phone Number)
			Simple attribute: ជាជួរឈដែលតម្លៃរបស់វាមិនអាចចែកចេញជាផ្នែកៗបានទេ។ (Sex)
			Single-value attribute: ជាជួរឈនៅក្នុងមួយជួរដេកមានតម្លៃតែមួយប៉ុណ្ណោះ។
			Multivalued attribute: ជាជួរឈដែលក្នុងមួយជួដេកអាចមានតម្លៃច្រើន។ 
			Derived attribute: ជាជួរឈដែលតម្លៃរបស់វាបានពីការធ្វើប្រមាណវិធីទៅលើជួរឈដទៃទៀត។

		









