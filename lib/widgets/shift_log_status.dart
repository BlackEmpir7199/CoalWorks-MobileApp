import 'package:flutter/material.dart';
import 'package:mcoalworks/screens/web_view.dart';

class ShiftLogStatus extends StatelessWidget {
  final double progressPercentage;
  final bool isSubmitted;
  final String shiftLogUrl;

  const ShiftLogStatus({
    Key? key,
    required this.progressPercentage,
    required this.isSubmitted,
    required this.shiftLogUrl,
  }) : super(key: key);

  void _openShiftLogWebView(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ShiftLogWebView(url: shiftLogUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Icon(
                  isSubmitted ? Icons.check_circle : Icons.pending,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              title: Text(
                isSubmitted ? 'Shift Log Submitted' : 'Shift Log in Progress',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                isSubmitted
                    ? 'Your shift log has been successfully submitted.'
                    : 'Complete and submit your shift log.',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              //  trailing: isSubmitted
              //     ? null
              //     : Text(
              //         '${(progressPercentage * 100).toInt()}%',
              //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              //               fontWeight: FontWeight.bold,
              //               color: Theme.of(context).primaryColor,
              //             ),
              //       ),
            ),
            if (!isSubmitted) ...[
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: progressPercentage,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              ShiftLogButton(
                onPressed: () => _openShiftLogWebView(context),
              ),
            ],
            if (isSubmitted) ...[
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () => _openShiftLogWebView(context),
                icon: Icon(Icons.visibility),
                label: Text('View Submitted Log'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  side: BorderSide(color: Theme.of(context).primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ShiftLogButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ShiftLogButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.edit_note),
      label: Text('Fill Shift Log'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

