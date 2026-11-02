import 'package:flutter/material.dart';

void main() {
  runApp(const FinlyApp());
}

const Color primaryGreen = Color(0xFF138765);
const Color darkGreen = Color(0xFF075C46);
const Color lightGreen = Color(0xFFE4F5EC);
const Color backgroundColor = Color(0xFFF7FAF8);

class FinlyApp extends StatelessWidget {
  const FinlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finly - Financial Friendly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryGreen,
          primary: primaryGreen,
        ),
        fontFamily: 'Roboto',
      ),
      home: const LoginPage(),
    );
  }
}

// =========================
// HALAMAN LOGIN
// =========================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomePage(
          userEmail: _emailController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 24),

                    // LOGO
                    const Icon(
                      Icons.account_balance_wallet_rounded,
                      color: primaryGreen,
                      size: 72,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Finly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),

                    const Text(
                      'FINANCIAL FRIENDLY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 12,
                        color: primaryGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Kelola keuanganmu dengan mudah.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Mulai langkah kecil menuju masa depan '
                      'finansial yang lebih baik.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 36),

                    const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputDecoration(
                        hint: 'Masukkan email kamu',
                        icon: Icons.email_outlined,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email wajib diisi.';
                        }

                        if (!RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        ).hasMatch(value.trim())) {
                          return 'Masukkan format email yang valid.';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: _inputDecoration(
                        hint: 'Masukkan password',
                        icon: Icons.lock_outline,
                      ).copyWith(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password wajib diisi.';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 12),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Fitur lupa password akan dibuat nanti.',
                              ),
                            ),
                          );
                        },
                        child: const Text('Lupa password?'),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: _login,
                        style: FilledButton.styleFrom(
                          backgroundColor: primaryGreen,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'FINANCIAL FRIENDLY',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Atur uangmu hari ini, untuk masa depanmu.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: darkGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration({
  required String hint,
  required IconData icon,
}) {
  return InputDecoration(
    hintText: hint,
    prefixIcon: Icon(icon, color: primaryGreen),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 18,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFDCE5E0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFDCE5E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: primaryGreen,
        width: 1.5,
      ),
    ),
  );
}

// =========================
// HALAMAN HOME
// =========================

class HomePage extends StatefulWidget {
  final String userEmail;

  const HomePage({
    super.key,
    required this.userEmail,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  bool _showBalance = true;

  

  final double income = 8000000;
  final double expense = 2750000;

  String get formattedBalance {
    return _currency(income - expense);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildDashboard(),
          _buildPlaceholder(
            Icons.receipt_long_outlined,
            'Transaksi',
            'Catat dan kelola semua transaksi keuanganmu.',
          ),
          _buildPlaceholder(
            Icons.bar_chart_rounded,
            'Laporan',
            'Pantau perkembangan keuanganmu setiap bulan.',
          ),
          _buildProfile(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            label: 'Transaksi',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        children: [
          // HEADER
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: primaryGreen,
                  size: 30,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Finly',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: darkGreen,
                      ),
                    ),
                    Text(
                      'Financial Friendly',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Belum ada notifikasi baru.'),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications_none_rounded),
              ),
            ],
          ),

          const SizedBox(height: 28),

          const Text(
            'Halo, teman Finly! 👋',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Yuk, kelola keuanganmu lebih baik hari ini.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 24),

          // KARTU SALDO
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [primaryGreen, darkGreen],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: primaryGreen.withValues(alpha: 0.18),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Saldo Tersisa',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        setState(() {
                          _showBalance = !_showBalance;
                        });
                      },
                      icon: Icon(
                        _showBalance
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                Text(
                  _showBalance ? formattedBalance : 'Rp •••••••',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                const Divider(color: Colors.white30),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: _moneySummary(
                        icon: Icons.arrow_downward_rounded,
                        label: 'Pemasukan',
                        amount: income,
                        positive: true,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 55,
                      color: Colors.white30,
                    ),
                    Expanded(
                      child: _moneySummary(
                        icon: Icons.arrow_upward_rounded,
                        label: 'Pengeluaran',
                        amount: expense,
                        positive: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // SARAN FINANSIAL
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline_rounded,
                      color: primaryGreen,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Saran Finly',
                        style: TextStyle(
                          color: darkGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  'Yuk, pertahankan kebiasaan baikmu!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Pengeluaranmu ${((expense / income) * 100).round()}% '
                  'dari pemasukan bulan ini. '
                  'Sebagai panduan awal, kamu bisa menargetkan '
                  'pengeluaran maksimal 70% dari pemasukan, '
                  'menyesuaikannya dengan kebutuhan pokokmu.',
                  style: const TextStyle(
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // AKSI CEPAT
          const Text(
            'Aksi Cepat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _quickAction(
                  icon: Icons.add_circle_outline_rounded,
                  label: 'Pemasukan',
                  color: Colors.green,
                  onTap: () => _showFeatureMessage('Tambah Pemasukan'),
                ),
              ),
              Expanded(
                child: _quickAction(
                  icon: Icons.remove_circle_outline_rounded,
                  label: 'Pengeluaran',
                  color: Colors.redAccent,
                  onTap: () => _showFeatureMessage('Tambah Pengeluaran'),
                ),
              ),
              Expanded(
                child: _quickAction(
                  icon: Icons.insert_chart_outlined_rounded,
                  label: 'Laporan',
                  color: Colors.blue,
                  onTap: () => setState(() => _selectedIndex = 2),
                ),
              ),
              Expanded(
                child: _quickAction(
                  icon: Icons.category_outlined,
                  label: 'Kategori',
                  color: Colors.deepPurple,
                  onTap: () => _showFeatureMessage('Kategori'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // RINGKASAN PENGELUARAN
          const Text(
            'Ringkasan Pengeluaran',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          _expenseCategory(
            icon: Icons.restaurant_outlined,
            name: 'Makanan & Minuman',
            amount: 1200000,
            percentage: 0.44,
            color: Colors.orange,
          ),

          _expenseCategory(
            icon: Icons.directions_bus_outlined,
            name: 'Transportasi',
            amount: 600000,
            percentage: 0.22,
            color: Colors.blue,
          ),

          _expenseCategory(
            icon: Icons.receipt_outlined,
            name: 'Tagihan & Utilitas',
            amount: 450000,
            percentage: 0.16,
            color: Colors.deepPurple,
          ),

          _expenseCategory(
            icon: Icons.shopping_bag_outlined,
            name: 'Belanja',
            amount: 500000,
            percentage: 0.18,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget _moneySummary({
    required IconData icon,
    required String label,
    required double amount,
    required bool positive,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 17,
                color: positive ? Colors.greenAccent : Colors.orangeAccent,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              _showBalance ? _currency(amount) : 'Rp •••••••',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _expenseCategory({
    required IconData icon,
    required String name,
    required double amount,
    required double percentage,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDF1EE)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  _currency(amount),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: percentage,
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(8),
                  backgroundColor: const Color(0xFFEDF1EE),
                  color: color,
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Text(
            '${(percentage * 100).round()}%',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: Text(
              'Profil Saya',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightGreen,
                border: Border.all(color: primaryGreen, width: 3),
              ),
              child: const Center(
                child: Text(
                  'MJ',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: primaryGreen,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Marcell Jansen',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              widget.userEmail,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: FilledButton.icon(
              onPressed: () => _showFeatureMessage('Edit Profil'),
              icon: const Icon(Icons.edit_outlined),
              label: const Text('Edit Profil'),
              style: FilledButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Informasi Akun',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: darkGreen,
            ),
          ),
          const SizedBox(height: 14),
          _profileCard(
            icon: Icons.person_outline_rounded,
            title: 'Nama Lengkap',
            subtitle: 'Marcell Jansen',
          ),
          _profileCard(
            icon: Icons.email_outlined,
            title: 'Email',
            subtitle: widget.userEmail,
          ),
          _profileCard(
            icon: Icons.phone_outlined,
            title: 'Nomor Telepon',
            subtitle: 'Belum diisi',
          ),
          const SizedBox(height: 22),
          const Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: darkGreen,
            ),
          ),
          const SizedBox(height: 14),
          _profileMenu(
            icon: Icons.settings_outlined,
            title: 'Pengaturan Aplikasi',
            subtitle: 'Atur preferensi aplikasi',
            onTap: () => _showFeatureMessage('Pengaturan Aplikasi'),
          ),
          _profileMenu(
            icon: Icons.lock_outline_rounded,
            title: 'Keamanan',
            subtitle: 'Kelola keamanan akun',
            onTap: () => _showFeatureMessage('Keamanan'),
          ),
          _profileMenu(
            icon: Icons.help_outline_rounded,
            title: 'Bantuan',
            subtitle: 'Informasi dan bantuan Finly',
            onTap: () => _showFeatureMessage('Bantuan'),
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: _confirmLogout,
            icon: const Icon(Icons.logout_rounded),
            label: const Text('Keluar dari Akun'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _profileCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5ECE7)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryGreen),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileMenu({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5ECE7)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        leading: Icon(icon, color: primaryGreen, size: 28),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: Colors.black45,
        ),
        onTap: onTap,
      ),
    );
  }

  void _confirmLogout() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Keluar dari akun?'),
        content: const Text(
          'Apakah kamu yakin ingin keluar dari Finly?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Batal'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(dialogContext);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(
    IconData icon,
    String title,
    String description,
  ) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 72,
                color: primaryGreen,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFeatureMessage(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Fitur $feature akan kita buat pada tahap berikutnya.',
        ),
      ),
    );
  }
}

String _currency(double amount) {
  final digits = amount.round().toString();
  final formatted = digits.replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (match) => '.',
  );

  return 'Rp $formatted';
}