public class ViewProgram{
    //my commits
    public String userSelect { get; set; }
    public String dateSelect { get; set; }
    public String message { get; set; }

    public ViewProgram(){
    }
    
    public List<SelectOption> services {
        get {
            if(services==null) {
                List<User> users = [SELECT id, name FROM User];
                services = new List<SelectOption>();
                services.add(new SelectOption('All','All'));
                for(User obj : users) {
                    services.add(new SelectOption(obj.id,obj.name));
                    System.debug('User: '+obj.name);
                }
            }
            return services;
        }
        set;
    }
    
    public List<SelectOption> dates {
        get {
            if(dates==null) {
                List<Calendar__c> dateCalendar = [SELECT id, name, Date__c FROM Calendar__c];
                dates = new List<SelectOption>();
                dates.add(new SelectOption('All','All'));
                for(Calendar__c obj : dateCalendar) {
                    dates.add(new SelectOption(obj.id,obj.name + '(' + string.valueOf(obj.Date__c) + ')'));
                    System.debug('date: '+obj.name);
                }
                
            }
            return dates;
        }
        set;
    }
    
    public PageReference option() {

        PageReference newPage;
        newPage = Page.selectionParametersView;
        newPage.getParameters().put('userId', userSelect);
        newPage.getParameters().put('dateId', dateSelect);
        //return (new pagereference ('/apex/selectionParametersView' + '?user=' + userSelect +'&date=' + dateSelect).setredirect(true));
        return newPage.setRedirect(true);
    }
    
    public PageReference addPrograms() {
    	PageReference newPage;
        newPage = Page.addProgram;
        //newPage.getParameters().put('PageBack', 'ViewProgram');
    	return newPage.setredirect(true);
    }
}