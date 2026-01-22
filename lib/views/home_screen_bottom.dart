import 'package:flutter/material.dart';

class HomeScreenBottom extends StatefulWidget {
  const HomeScreenBottom({super.key});

  @override
  State<HomeScreenBottom> createState() => _HomeScreenBottomState();
}

class _HomeScreenBottomState extends State<HomeScreenBottom> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const Color themeYellow = Color.fromARGB(255, 252, 177, 3);

    // MediaQuery variables for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Circular Icons Section
              Container(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTopMenu(
                      "assets/images/daily_horoscope.png",
                      "Daily\nHoroscope",
                      screenWidth,
                    ),
                    _buildTopMenu(
                        "assets/images/kundali.png", "Kundli", screenWidth),
                    _buildTopMenu(
                      "assets/images/match_ring.png",
                      "Match\nMatching",
                      screenWidth,
                    ),
                    _buildTopMenu(
                      "assets/images/read.png",
                      "Astrology\nBlog",
                      screenWidth,
                    ),
                  ],
                ),
              ),

              // Promo Banner - Responsive Height
              _buildPromoBanner(themeYellow, screenWidth, screenHeight),

              // Section Header
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "CHAT/CALL WITH ASTROLOGER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.040,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: themeYellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Horizontal Astrologer Cards - Responsive sizing
              SizedBox(
                height: screenHeight * 0.28, // Dynamic height based on screen
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  children: [
                    _buildAstroCard(
                      "D K",
                      "16 Years",
                      "₹60/Min.",
                      "https://i.pravatar.cc/150?u=dk",
                      screenWidth,
                      themeYellow,
                    ),
                    _buildAstroCard(
                      "Dolly",
                      "3 Years",
                      "₹27/Min.",
                      "https://i.pravatar.cc/150?u=dolly",
                      screenWidth,
                      themeYellow,
                    ),
                    _buildAstroCard(
                      "Sagar",
                      "5 Years",
                      "₹40/Min.",
                      "https://i.pravatar.cc/150?u=sagar",
                      screenWidth,
                      themeYellow,
                    ),
                    _buildAstroCard(
                      "Sagar",
                      "5 Years",
                      "₹40/Min.",
                      "https://i.pravatar.cc/150?u=sagar",
                      screenWidth,
                      themeYellow,
                    ),
                    _buildAstroCard(
                      "Sagar",
                      "5 Years",
                      "₹40/Min.",
                      "https://i.pravatar.cc/150?u=sagar",
                      screenWidth,
                      themeYellow,
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Bottom Grid Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildSmallGridItem(
                        "assets/images/swastika.png",
                        themeYellow,
                        screenHeight,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildSmallGridItem(
                        "assets/images/sky.png",
                        themeYellow,
                        screenHeight,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildSmallGridItem(
                        "assets/images/add_to_cart.png",
                        themeYellow,
                        screenHeight,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                padding: EdgeInsets.all(screenWidth * 0.05),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeYellow, // Ya jo bhi aapka banner color hai
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "India's Best\nAstrology App With",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Vastu Experience",
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.brown,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                        height:
                            20), // Spacer() ki jagah yahan fixed gap behtar hai
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: const StadiumBorder(),
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.025,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        "Connect with Expert Astrologer",
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          height: 1.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  // --- Updated Helper Widgets with ScreenWidth/Height ---

  Widget _buildWalletIcon(double sw) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: 16,
            color: Colors.black,
          ),
          SizedBox(width: 4),
          Text(
            '₹0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopMenu(String imagePath, String label, double sw) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(sw * 0.025),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12),
          ),
          child: Image.asset(
            imagePath,
            width: sw * 0.14,
            height: sw * 0.14,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 6),

        // ✅ FIXED HEIGHT TEXT
        SizedBox(
          height: sw * 0.07, // same space for all
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              fontSize: sw * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner(Color color, double sw, double sh) {
    return Container(
      margin: EdgeInsets.all(sw * 0.04),
      height: sh * 0.2, // 20% of screen height
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -sw * 0.25,
            top: -sh * 0.01,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                "assets/images/daily_horoscope.png",
                width: sw * 0.5,
                height: sw * 0.5,
                // fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(sw * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "India's Best\nAstrology App With",
                  style: TextStyle(
                    fontSize: sw * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Vastu Experience",
                  style: TextStyle(
                    fontSize: sw * 0.035,
                    color: Colors.brown,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const StadiumBorder(),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: sw * 0.025,
                      vertical: 10,
                    ),
                  ),
                  child: Text(
                    "Connect with Expert Astrologer",
                    style: TextStyle(
                      fontSize: sw * 0.025,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAstroCard(
    String name,
    String exp,
    String rate,
    String imgUrl,
    double sw,
    Color cardColor,
  ) {
    return Container(
      width: sw * 0.4, // Each card takes 40% of screen width
      margin: EdgeInsets.only(right: sw * 0.03, bottom: 5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: sw * 0.09,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(imgUrl),
          ),
          SizedBox(height: sw * 0.02),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: sw * 0.04),
          ),
          Text(
            "Exp: $exp",
            style: TextStyle(fontSize: sw * 0.028, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4.7",
                style: TextStyle(
                  fontSize: sw * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.star, size: 14, color: Colors.orange),
            ],
          ),
          Text(
            rate,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallGridItem(String imagePath, Color color, double sh) {
    return Container(
      width: double.infinity,
      height: sh * 0.08,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          height: sh * 0.055,
          width: sh * 0.055,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
