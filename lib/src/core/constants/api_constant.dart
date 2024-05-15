class Endpoints {
  Endpoints._();

  // ALL PRODUCTION BASEURL
  static const String baseUrl = "https://dev.payam.ng";
  // static const String sockectBaseURl =
  //     'wss://real-estate-sieg.vercel.app/ws/chat/';

// //___________________________CHAT____________________
//   static String chatSocketURL(String receiverId, String senderId) {
//     return 'wss://real-estate-sieg.up.railway.app/ws/chat/$senderId/$receiverId';
//     // return 'wss://real-estate-sieg.up.railway.app/ws/chat/$roomId?token=$token';
//   }

//   static const String allMessage = '/api/v1/chats/messages/all';
//   static const String checkCoin = '/api/v1/points/check/coin';

//   static String allRoomMessage(String roomId) {
//     return '/api/v1/chats/messages/$roomId';
//   }

//   static String checkChatCoin(String agentId) {
//     return '/api/v1/chats/message/$agentId/check-coin';
//   }

//   static String checkProListingCoin = "/api/v1/points/check/coin";

//   // receiveTimeout
  static const int receiveTimeout = 20000;

//   // connectTimeout
  static const int connectionTimeout = 20000;
// //_________________________________________AUTH_____________________________________________
//   static const String userLogin = '/api/v1/auth/user-login';
//   static const String agentLogin = '/api/v1/auth/agent-login';
//   static const String notification = '/api/v1/notifications/all';

//   static const String logout = '/api/v1/auth/logout';
  static const String createPasscode = '/api/register/step4';
  static const String confirmCreatePasscode = '/api/register/step5';
//   static const String userProfile = '/api/v1/auth/user_profile/details';
//   static String updateProfile(String userType) {
//     return '/api/v1/auth/${userType}_profile/details';
//   }

  // static String newPassword(String token) {
  //   return '/api/v1/auth/change/forgot-password/$token';
  // }
  // static String newPassword(String token) {
  //   return '/api/v1/auth/change/forgot-password/$token';
  // }
  static String createUserAcct(String phone) {
    return "/api/register/step3/234$phone";
  }

  static const String sendSMSOtp = '/api/register/step1';

//   static const String sendForgetOtp =
//       "/api/v1/auth/request/forgot-password/code";
  static const String verifySMSOTP = '/api/register/step2';
//   static const String verifyForgetOTP =
//       '/api/v1/auth/verify/forgot-password/code';

//   static const String consumerKYC = '/consumer/getConsumnerKYC';
//   static const String getBankList = '/nipservice/api/v1/util/get-nip-fi-list';
//   static const String getNewBankList = '/getallinstitutions';
//   static String consumerAllTransaction(String userType, [String page = '1']) {
//     return '/$userType/transactions/all?limit=30&page=$page';
//   }

//   static String transactionById(String userType, String id) {
//     return '/$userType/transactions/$id';
//   }

//   static String getMerkycByUID(String uid) {
//     return "/api/v1/searchmerchantkycdetailsbyuid/$uid";
//   }

//   //________________________--Properties_____________________________________

//   // static const String allProperties = '/api/v1/property/properties/all';

//   static String allProperties(String city, state) {
//     return '/api/v1/property/properties/all?city=$city&state=$state';
//   }

//   static String tryAllPro = '/api/v1/property/properties/all';

//   static const String allPropertyType = "/api/v1/property/property/types/all";
//   static const String addProperty = "/api/v1/property/add/property/";
//   static String agentPropertiesbyId(String id) {
//     return '/api/v1/property/agent_properties/$id';
//   }

//   static const String propertyCondition =
//       "/api/v1/property/property/conditions/all";
//   static const String allResType =
//       "/api/v1/property/property/residence/types/all";

//   static const String allAgentProperties =
//       '/api/v1/property/agent_properties/all';
//   static const String allWatchList = '/api/v1/property/watchlist/all';
//   static String propertiesbyId(String id) {
//     return '/api/v1/property/properties/$id';
//   }

//   static const String propertiesAppliance = "/api/v1/property/appliances/all";
//   static const String filterProperties = "/api/v1/property/properties/filters";
//   static const String searchProperties = "/api/v1/property/search/properties/";

//   static String addWatchListbyId(String id) {
//     return '/api/v1/property/watchlist/$id';
//   }

//   //---------------------Refresh Token--------------------------
  static const String refreshToken = '/api/v1/auth/refresh/token';
// //---------------------------Merchant Onboarding Process-----------------------------

//   static const String validateTin = '/camlsystem/api/v1/validatetin';
//   static const String getOTPByEmail = '/api/v1/auth/getOTPByEmail';

//   //________________________________COIN______________________________________
//   static const String allCoinList = '/api/v1/points/all';
//   static const String tranHistory = '/api/v1/points/transactions/history';
//   static String purchaseCoinbyId(String coinId) {
//     return '/api/v1/points/purchase-coins/$coinId';
//   }

//   static String verifyPurchaseCoin(String txf) {
//     return '/api/v1/points/verify-purchase/$txf';
//   }

//   static const String createMerchant = '/api/v1/createmerchantdetails';
//   static String getMerchantDetailsTIN(String tin) {
//     return '/api/v1/searchmerchantkycdetailsbyuid/$tin';
//   }

//   //SECURED STORAGE KEY
  static const String oneSignalAppID = 'edd68c45-b86d-4820-97d6-37c6349d3aa6';
  static const String access_token = 'access_token';
  static const String refresh_token = 'refresh_token';
  static const String firstTime = '0';
  static const String userDataMap = 'userDataMap';
  static const String userName = 'userName';
  static const String acctType = 'user';

//   //___________________________JOB APIs____________________________

//   static const String allJobs = "/api/v1/jobs/all";
//   static const String allJobsType = "/api/v1/jobs/job_types/all";
//   static const String createJobs = "/api/v1/jobs/create";
//   static const String allAgentJobs = "/api/v1/jobs/agent/all";
//   static String getJobDetailbyId(String id) {
//     return '/api/v1/jobs/job/$id';
//   }

//   static String getJobFullDetailbyId(String id) {
//     return '/api/v1/jobs/agent/job/$id';
//   }

//   static String updateJobById(String id) {
//     return '/api/v1/jobs/update/$id';
//   }

//   static String deleteJobById(String id) {
//     return '/api/v1/jobs/delete/$id';
//   }

//   //___________________________ESCROW__________________________

//   static String requestEscrowById(String id) {
//     return '/api/v1/escrow/request/$id';
//   }

//   static String getEscrowById(String id) {
//     return '/api/v1/escrow/retrieve/$id';
//   }
//    static String uploadProof(String id) {
//     return '/api/v1/escrow/payment-proof/upload/$id';
//   }
//  static String acceptEscrowById(String action,String id) {
//     return '/api/v1/escrow/$action/$id';
//   }
//   static const String allEscrow = "/api/v1/escrow/escrows/all";
}
