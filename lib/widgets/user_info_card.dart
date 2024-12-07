import 'package:flutter/material.dart';
import 'package:mcoalworks/models/user.dart';
import 'package:shimmer/shimmer.dart';

class UserInfoCard extends StatefulWidget {
  final UserModel user;

  const UserInfoCard({Key? key, required this.user}) : super(key: key);

  @override
  _UserInfoCardState createState() => _UserInfoCardState();
}

class _UserInfoCardState extends State<UserInfoCard> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.grey[900]!,
              Colors.grey[800]!,
            ],
          ),
        ),
        child: _isLoading ? _buildLoadingContent() : _buildUserContent(),
      ),
    );
  }

  Widget _buildLoadingContent() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[700]!,
      highlightColor: Colors.grey[600]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: 150,
                      height: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildUserContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: widget.user.profileImage != null
                  ? NetworkImage(widget.user.profileImage!)
                  : null,
              child: widget.user.profileImage == null
                  ? Text(
                      widget.user.username[0].toUpperCase(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  : null,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.username,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.user.email,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[300],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        _buildInfoRow(Icons.phone, widget.user.phone ?? 'N/A'),
        SizedBox(height: 12),
        _buildRoleBadge(),
        SizedBox(height: 12),
        _buildStatusBadge(),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[400]),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.grey[300]),
        ),
      ],
    );
  }

  Widget _buildRoleBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: widget.user.isSupervisor ? Colors.amber[700] : Colors.blue[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.user.isSupervisor ? Icons.star : Icons.person,
            size: 16,
            color: Colors.white,
          ),
          SizedBox(width: 6),
          Text(
            widget.user.isSupervisor ? 'Supervisor' : 'Employee',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: widget.user.isActive ? Colors.green[700] : Colors.red[700],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6),
          Text(
            widget.user.isActive ? 'Active' : 'Inactive',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}