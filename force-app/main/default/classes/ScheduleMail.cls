global class ScheduleMail implements Schedulable
{
    global void execute(SchedulableContext ctx)
    {
        SendMailing a = new SendMailing();
        a.sendMail();
    }
}