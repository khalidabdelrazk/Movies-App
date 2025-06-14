class ApiEndpoints {
  static const String moviesBaseUrl = "https://yts.mx/api/v2";

  // Movie Listing
  static const String listMovies = "https://yts.mx/api/v2/list_movies.json";
  static const String listMoviesJsonp = "$moviesBaseUrl/list_movies.jsonp";
  static const String listMoviesXml = "$moviesBaseUrl/list_movies.xml";

  // Movie Details
  static const String movieDetails = "$moviesBaseUrl/movie_details.json";
  static const String movieDetailsJsonp = "$moviesBaseUrl/movie_details.jsonp";
  static const String movieDetailsXml = "$moviesBaseUrl/movie_details.xml";

  // Movie Suggestions
  static const String movieSuggestions =
      "$moviesBaseUrl/movie_suggestions.json";
  static const String movieSuggestionsJsonp =
      "$moviesBaseUrl/movie_suggestions.jsonp";
  static const String movieSuggestionsXml =
      "$moviesBaseUrl/movie_suggestions.xml";

  // Movie Parental Guides
  static const String parentalGuides =
      "$moviesBaseUrl/movie_parental_guides.json";
  static const String parentalGuidesJsonp =
      "$moviesBaseUrl/movie_parental_guides.jsonp";
  static const String parentalGuidesXml =
      "$moviesBaseUrl/movie_parental_guides.xml";

  static const String authBaseUrl = "https://route-movie-apis.vercel.app";
  // Auth
  static const String login = "$authBaseUrl/auth/login";
  static const String register = "$authBaseUrl/auth/register";
  static const String resetPassword = "$authBaseUrl/auth/reset-password";

  // Favorites
  static const String getAllFavorites = "$authBaseUrl/favorites/all";
  static const String addToFavorites = "$authBaseUrl/favorites/add";
  static String removeFavorite(String movieId) =>
      "$authBaseUrl/favorites/remove/$movieId";
  static String isFavorite(String movieId) =>
      "$authBaseUrl/favorites/is-favorite/$movieId";

  // Profile
  static const String updateProfile = "$authBaseUrl/profile";
  static const String getProfile = "$authBaseUrl/profile";
  static const String deleteProfile = "$authBaseUrl/profile";
}
