class ApiEndpoints {
  static const String baseUrl = 'https://zbooma.com/furniture_api/';
  static const String stripeUrl = 'https://api.stripe.com/v1/payment_intents';
  static const String login = '${baseUrl}auth/login.php';
  static const String register = '${baseUrl}auth/register.php';
  static const String cart = '${baseUrl}cart/cart.php';
  static const String getProducts = '${baseUrl}products/get_products.php';
  static const String getCategories = '${baseUrl}categories/get_categories.php';
}
