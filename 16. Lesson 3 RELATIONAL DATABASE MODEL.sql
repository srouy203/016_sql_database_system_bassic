										LESSON 3				RELATIONAL DATABASE MODEL

3.1 Characteristics of a Relational Table
		1. តារាងគឺជារចនាសម្ព័ន្ធដែលកើតចេញពីបន្សំរវាងជួរឈរជាច្រើន និង​ជួរដេកជាច្រើន
		2. ជួរដេកមួយនៃតារាងតំណាងព័ត៌មានមួយ
		3. ជួរឈរមួយនៃតារាងតំណាងទិន្នន័យមួយប្រភេទ
		4. ប្រសព្វជួរឈរ និងជួរដេកតំណាងតម្លៃនៃទិន្នន័យមួយ
		5. តម្លៃដែលស្ថិតនៅក្នុងជួរឈរជាមួយគ្នា ត្រូវមានទម្រង់ទិន្នន័យដូចគ្នា
		6. ជួរឈរនីមួយៗ តែងមានចន្លោះតម្លៃរបស់វាគឺ ដែនតម្លៃ (Attribute domain)
		7. លំដាប់ជួរឈរ​ និងលំដាប់ជួរដេកមិនជារបស់ DBMS
		8. តារាងនីមួយៗ ត្រូវតែមាន KEY 

		KEYS (គន្លឹះ) ជាជួរឈរមួយ ឬ បន្សំជួរឈរពីរ ដែលកំណត់ជួរឈរដទៃ។
		-	Each row in a table must be uniquely identifiable
		-	Key is one or more attributes that determine other attributes
		-	Keys role is based on determination
				- if you know the value of attribute A, you can determine the value of attrubute B
		-	

		-	Composite key	ផ្សំចេញពីជួរឈរពីរ	   (មាន primary key and ference key)
			+	Compostied of more than one attribute
		-	Key attribute	ជួរឈរដែលជាធាតុផ្សំនៃ key (1ជួរ)
			+	Any attribute that is part of a key
		-	Superkey	មាន key ជាធាតុផ្សំ	   (យក primary key ទៅផ្សំជាមួយជួរឈរមួយទៀត)
			+	Any key that uniquely identifies each row
		-	Candidate key	ជួរឈរដែលអាចជា key	
			+	ត្រូវមានតម្លៃខុសៗគ្នា (មិនស្ទួន)
			+	មិនធំពេក	(មានន័យពីរយ៉ាងគឺ ចំនួនជួរឈរតិច និងចំនួន byte)
			+	មានន័យ(ទិន្នន័យដើម) 

			ចំណាំ៖	(រាល់ទិន្នន័យដើមទាំងអស់សុទ្ធតែស្ទួន គ្រាន់តែតិច ឬច្រើន ឯទិន្នន័យដែលមិនស្ទួនគឺជាទិន្នន័យដែលគេបង្កើត ឬប្រឌិតឡើងតែប៉ុណ្ណោះ)។
			

	ឧទាហរណ៍៖
															+ ID(Identifier)
		Primary Key = Table Name		+ Code
															+ Number

		Unique key		(ធានាថាព័ត៌មានមួយមិនត្រូវបានបញ្ចូលច្រើនដង)
		តារាងនិស្សិតផ្ទុកព័ត៌មានរបស់និស្សិតទាំងអស់ដែលរួមផ្សំពីទិន្នន័យប្រាំប្រភេទគឺ ឈ្មោះ ភេទ ថ្ងៃខែឆ្នាំកំណើត អាស័យដ្ឋាន និងលេខទូរស័ព្ទ។
		Student(StudentName, Sex, BirthDate, Address, TelephoneNumber)
		Candidate keys 
				1. StudentName + Birthdate
				2. StudentName + Address								//ធំពេក
				3. StudentName + TelephoneNumber				//មិនព័ត៌មានដើម
		Unique key
				StudentName + Birthdate
			
		- Nulls
			+ No data entry : រំលងចោល
			+ No permtted in primary key	 : ការកែតម្លៃពីមិន null ទៅ null
			+ Should be avoided in other attributes : បើអាចមិនប្រើ កុំប្រើ
			+Can represent:
				- An unknown attribute value
				- A known, but missing, attribute value
				- A "not applicable" condition
			+ Can create problems when functions such as COUNT, AVERAGE, and SUM are used
			**បង្ការបញ្ហាការធ្វើប្រមាណវិធីជាមួយនឹង null ចូលប្រើអនុគមន៍ដែលមានស្រាប់របស់ DBMS នីមួយៗ ប្តូរវាទៅសូន្យបើ null
			+ Can create logical problems when relational tables are linked
			**បង្ការបញ្ហា null និង inner join ដោយជំនួសមកវិញនូវ left outer join, right outer join ឬ full outer join

	*** Data redundancy : ភាពលើសនៃទិន្នន័យ (ការរក្សាទុកទិន្នន័យតែមួយជាច្រើនដងដោយមិនចាំបាច់ គេហៅថាទិន្នន័យលើស)។
		- Controlled redundancy
			 +Makes the relational database work
			 + Tables within the database share common attrbutes
				- Enable tables to be linked together
			+ Multiple occurrences if values not redundant when requred to make the relationship work
			+ Redundancy exits only when there is unneccessary duplication of attribute values
			** Foreign key អាចស្ទួនស្របច្បាប់ ព្រោះវាតំណាងអោយច្រើន។ ជួរឈដែលមានតម្លៃតិច ក៏ស្ទួនស្របច្បាប់ដែរ (Sex)។
		
	+ Foreign Key (FK): ជាជួរឈ លមានឈ្មោះដូច និងមានតម្លៃដូចទៅនឹង primary key (PK)។
	+ Referenctail intergrity : ធានាភាពត្រឹមត្រូវនៃទំនាក់ទំនង។
	+ Secondary key : អាចប្រើដូច primary key ដែរ តែមានសម្ថភាពចាញ់ primary key (គន្លឹះទីពីរនៃការស្វែងរកព័ត៌មាន)។

	INTEGRITU RULES ជាច្បាប់ធានាភាពត្រឹមត្រូវនៃទំនាក់ទំនង គឺ Primary key ត្រូវមានតម្លៃខុសៗគ្នា ឯ Foreign key អាចអត់តម្លៃ(Null) បើមានតម្លៃត្រូវតែដូចទៅនឹងតម្លៃ Primary key។
	Data Dictionary ផ្តល់ព័ត៌មានលំអិតពីតារាងនីមួយៗ ក្នុងមូលទិន្នន័យ ព្រមទាំងព័ត៌មានលំអិតពីជួរឈរនីមួយៗរបស់តារាង។ 
	System Catalog ផ្ទុកព័ត៌មានលំអិតពីររចនាសម្ព័ន្ធមូលទិន្នន័យដែលអ្នកប្រើប្រាស់ខ្វះមិនកើត។
	Relationships 
		- 1:M (1 to many relationship) ប្រភេទទំនាក់ទនងដែលតែងតែមានជាធម្មតាក្នុងមូលទិន្នន័យ។
		- 1:1 (1 to 1 relationship) ជាធម្មតាមិនមាននោះទេ លើកលែងតែត្រូវបានគេប្រឌិត ឬបង្កើតឡើងតែប៉ុណ្ណោះ។ 
		- M:M (many to many relationship) ប្រភេទទំនាក់ទំនងនេះត្រូវប្លែងជា 1:M ចំនួនពីរ។


	DATA REDUNDANCY REVISITED: ភាពមិនប្រក្រតីទិន្នន័យកើតឡើងដោយសារវត្តមានលើសនៃទិន្នន័យ។
		- Update anomaly: ភាពមិនប្រក្រតីពេលកែតម្រូវទិន្នន័យ កើតពេលកែទិន្នន័យពីខុសទៅត្រូវ ប៉ុន្តែនៅតែមានទិន្នន័យខុស។
		- Insert anomaly: ភាពមិនប្រក្រតីពេលបន្ថែមព័ត៌មានថ្មី កើតនៅពេលដែលបន្ថែមមួយជួរដេកនៃព័ត៌មានថ្មី តែបែជាបរាជ័យក្នុងការរក្សាទុកទៅវិញ។ 
		- Delete anomaly: ភាពមិនប្រក្រតីពេលលុបព័ត៌មាន ពេលលុបព័ត៌មានចាស់ ឬព័ត៌មានដែលលែងចាំបាច់ប្រើប្រាស់ប្រចាំថ្ងៃពីតារាងនៃមូលទិន្នន័យ បែជាទៅផងដែរនូវអ្វីដែលមិនចង់លុប។
		

	INDEXS: ជួរឈរណាដែលតែងតែប្រើជាលក្ខខណ្ឌស្វែងរកគួរតែដាក់ INDEX
















no choice is a choice