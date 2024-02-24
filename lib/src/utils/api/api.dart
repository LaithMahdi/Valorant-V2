class Api {
  Api._();
  static const String baseUrl = "https://valorant-api.com/v1";

  static const String agents = "$baseUrl/agents";
  static String agentByUuid(String uuid) => "$baseUrl/agents/$uuid";
}
