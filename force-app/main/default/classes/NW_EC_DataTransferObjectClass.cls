public class NW_EC_DataTransferObjectClass {
    
    public class MemberAuthorizations {
        //care request Items
        @AuraEnabled
        public Decimal  approvedUnits {get; set;}
        @AuraEnabled
        public String  serviceCategoryCode {get; set;}
        
        @AuraEnabled
        public String  modifierCode {get; set;}
        
        @AuraEnabled
        public Boolean noticeofAdmission {get; set;}	
        
        @AuraEnabled
        public String  caseNumber {get; set;}
        @AuraEnabled
        public String  RecordType {get; set;}
        
        @AuraEnabled
        public String  Id {get; set;}
        @AuraEnabled
        public String typeofService {get; set;}
        @AuraEnabled
        public String providerID {get; set;}
        @AuraEnabled
        public String status {get; set;}
                @AuraEnabled
        public String DeterminationStatus {get; set;}
        @AuraEnabled
        public String subject {get; set;}
        @AuraEnabled
        public Datetime reviewReceivedDate {get; set;}
        @AuraEnabled
        public Date serviceBeginDate {get; set;}
        @AuraEnabled
        public String numberofAuthorizedUnits {get; set;}
        @AuraEnabled
        public Date serviceEndDate {get; set;}
        @AuraEnabled
        public String serviceCode {get; set;}
        @AuraEnabled
        public Datetime lastModifiedDate {get; set;}
        @AuraEnabled
        public String servicingFacilityProvider {get; set;}
        @AuraEnabled
        public String requestingFacilityProvider {get; set;}
        @AuraEnabled
        public Datetime actualDischargeDate {get; set;}
        @AuraEnabled
        public String overrideRequestingProviderFacility {get; set;}
        
        public MemberAuthorizations() {
            
        }        
    }
    public class MemberDataAddress {
        
        @AuraEnabled
        public String street {get; set;}
        @AuraEnabled
        public String city {get; set;}
        @AuraEnabled
        public String country {get; set;}
        @AuraEnabled
        public String state {get; set;}
        @AuraEnabled
        public String postalCode {get; set;}
        @AuraEnabled
        public String accountname {get; set;}
        @AuraEnabled
        public String gender {get; set;}
        @AuraEnabled
        public String age {get; set;}
        @AuraEnabled
        public Date DOB {get; set;}
        @AuraEnabled
        public String AccountId {get; set;}
        @AuraEnabled
        public Boolean IsPrimary {get; set;}
        @AuraEnabled
        public Boolean IsDefault {get; set;}        
        public MemberDataAddress() {
            
        }
    }
    public Class MemberDetailsWithPlanClass { 
        @AuraEnabled
        public String Id {get;set;}
        @AuraEnabled
        public String Name {get;set;}        
        @AuraEnabled
        public String FirstName {get;set;}
        @AuraEnabled
        public String LastName {get;set;}
        @AuraEnabled
        public String MiddleName {get;set;}        
        @AuraEnabled
        public String SourceSystemId {get;set;}
        @AuraEnabled
        public Boolean NW_IsVIP {get;set;}
        @AuraEnabled
        public String NW_MemberIdentifier {get;set;}        
        @AuraEnabled
        public Date PersonBirthdate {get;set;}
        @AuraEnabled
        public List<Account> memberList {get;set;}
        //Plan details
        @AuraEnabled
        public String NW_MemberPoliceId {get;set;}  
        public MemberDetailsWithPlanClass() {
            memberList = new List<Account>(); 
            Id =''; NW_MemberPoliceId =''; NW_MemberIdentifier =''; NW_IsVIP = false; SourceSystemId = '';
            MiddleName = ''; LastName = ''; FirstName =''; Name =''; PersonBirthdate = null;
        }
    }
    
    public class MemberPlanClass {
        @AuraEnabled
        public String status {get;set;}
        @AuraEnabled
        public String name {get;set;}
        @AuraEnabled
        public String employerAccountName {get;set;}        
        @AuraEnabled
        public String memberNumber {get;set;}
        @AuraEnabled
        public String groupNumber {get;set;}
        @AuraEnabled
        public Date effectiveFrom {get;set;}        
        @AuraEnabled
        public Date effectiveTo {get;set;}
        @AuraEnabled
        public String planName {get;set;}
        @AuraEnabled
        public String payerName {get;set;}        
        @AuraEnabled
        public Date coverageEffectiveDate {get;set;}
        @AuraEnabled
        public Date coverageEndDate {get;set;}
        @AuraEnabled
        public String primarySecondaryTertiary {get;set;}        
        @AuraEnabled
        public String COBTypeCode {get;set;}
        @AuraEnabled
        public String memberId {get;set;} 
        public MemberPlanClass() {
            
        }
    }
    
    public class PortalLinksClass {
        @AuraEnabled
        public String tabname {get; set;}
        @AuraEnabled
        public String tabIcon {get; set;}
        @AuraEnabled
        public Boolean isAppeals {get; set;}
        @AuraEnabled
        public Boolean IsAuthorizations {get; set;}
        @AuraEnabled
        public Boolean IsBenefitInquiry {get; set;}
        @AuraEnabled
        public Boolean isCareManagerCollaboration {get; set;}
        @AuraEnabled
        public Boolean isCarePlan {get; set;}
        @AuraEnabled
        public Boolean isClaimsInquiry {get; set;}
        @AuraEnabled
        public Boolean isCMReferrals {get; set;}
        @AuraEnabled
        public Boolean isComplaintandGrievances {get; set;}
        @AuraEnabled
        public Boolean isContinueStayRequest {get; set;}
        @AuraEnabled
        public Boolean isDischarges {get; set;}
        @AuraEnabled
        public Boolean isProviderInquiry {get; set;}
        @AuraEnabled
        public Boolean isQOC {get; set;}        
        @AuraEnabled
        public Boolean isQualityofCareConcerns {get; set;}
        @AuraEnabled
        public Boolean isSCAInquiry {get; set;}
        @AuraEnabled
        public Boolean isSingleCaseAgreementInquiries {get; set;}
        @AuraEnabled
        public Boolean IsSubmitNoticeoAdmission {get; set;}
        
        public PortalLinksClass() {
            tabname = ''; tabIcon = ''; isAppeals = false;
        }        
    }
    
     public class UserWithGroupMemberClass {

        @AuraEnabled
        public String  firstName {get; set;}
        @AuraEnabled
        public String  lastName {get; set;}     
        @AuraEnabled
        public String  role {get; set;}
        @AuraEnabled
        public String  groupAction {get; set;}
        @AuraEnabled
        public String  userId {get; set;}
        @AuraEnabled
        public Boolean  isVIP {get; set;}
     public UserWithGroupMemberClass() {
         firstName ='';lastName = ''; role = ''; groupAction = ''; userId = ''; isVIP = false;
     }
     
 }

 public class TaskClass {
        @AuraEnabled
        public String firstName {get; set;}     
        @AuraEnabled
        public String lastName {get; set;} 
        @AuraEnabled
        public Date personBirthdate {get; set;}
             @AuraEnabled
        public String memberPoliceId {get; set;}     
                   @AuraEnabled
        public String accId {get; set;} 
     
        @AuraEnabled
        public String caseNumber {get; set;}     
        @AuraEnabled
        public String OwnerName {get; set;} 
        @AuraEnabled
        public String memberName {get; set;} 
        @AuraEnabled
        public Task tsData {get; set;}  
     public TaskClass() {
         caseNumber =''; OwnerName=''; memberName = ''; tsData = new Task();
     }
    }
}