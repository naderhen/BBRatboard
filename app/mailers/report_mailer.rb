class ReportMailer < ActionMailer::Base
  
  default :from => "naderhen@gmail.com"  
  
  
  
  def distribute_report(report,user,kit) 
    @report = report
    @user = user
    attachments['report.pdf']=kit.to_file
    mail(:to => user.email, :subject=>"Testing")
  end
end
