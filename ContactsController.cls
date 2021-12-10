public class ContactsController {
private String sortOrder = 'Name';
private date curDate; 
private date date20YAgo; 
private Integer s1;

public List<Contact> getContacts() {
    curDate = date.today();
    date20YAgo = curDate.addYears(-20);
    List<Contact> results = Database.query(
        'SELECT Id, Name, BirthDate, MobilePhone ' + 
        'FROM Contact ' +
        'WHERE MobilePhone != null and BirthDate != null and (' + 
            'CALENDAR_YEAR(BirthDate) < ' + date20YAgo.year() + ' or '+
        	'(CALENDAR_YEAR(BirthDate) = ' + date20YAgo.year() + 
              ' and CALENDAR_MONTH(BirthDate) < ' + date20YAgo.month() + ') or ' +
            '(CALENDAR_YEAR(BirthDate) = ' + date20YAgo.year() + 
              ' and CALENDAR_MONTH(BirthDate) = ' + date20YAgo.month() + 
        	  ' and DAY_IN_MONTH(BirthDate) <= ' + date20YAgo.day() + ')' + 
         ') ORDER BY ' + sortOrder + ' ASC ' +  
         'LIMIT 10'
    );
   return results;
}
    
public void sortByName() {
    this.sortOrder = 'LastName';  
}
}