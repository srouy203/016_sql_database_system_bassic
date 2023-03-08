/* 3.8 Create index.sql
	Index
		Index អាចត្រូវបានប្រើដើម្បីពន្លឿនល្បឿននៃការស្វែងរកព័ត៌មាន។
	Syntax:
		CREATE [UNIQUE]	INDEX IX_table_Column ON table (column1 [,column2])
*/
CREATE INDEX IX_Course_CourseName ON Course (CourseName);
