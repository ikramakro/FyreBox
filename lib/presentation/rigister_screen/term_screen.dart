import 'package:flutter/material.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PATENT & COPYRIGHT ACKNOWLEDGEMENT',
                  style: TextStyle(
                    fontSize: 15.0, // Larger font size for heading
                    fontWeight: FontWeight.bold, // Bold for emphasis
                    color: Colors.black, // Color for better visibility
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16.0), // Add space between heading and text
                Text(
                  '''This acknowledgment is made by the Client to Fyrebox (Pty) Ltd, a company, hereinafter called “The Patent/Copyright Holder”.
                  
By execution of this acknowledgment, the Client understands that it may not open the product, duplicate any portion of the product, download or amend any software associated with the product or make copies of the contents of the product under any circumstances during the Client’s possession of the Fyrebox product.
                  
The Client also understands and acknowledges that the The Patent/Copyright Holder has the right to change the Policy from time to time, including the term of the undertaking, the product components to which this undertaking refers or any software related to this product.
                  
The Client acknowledges its obligation to assign, and do hereby assign, inventions and patents that the Client may conceive or develop within the course and scope of its use of the product to the The Patent/Copyright Holder. The Client further acknowledge its obligation to promptly report and fully disclose the conception and/or reduction to practice of potentially patent-able inventions to the The Patent/Copyright Holder during the Client’s use of the product. The Client shall promptly furnish The Patent/Copyright Holder with complete information with respect to each.
                  
In selecting the below box of this acknowledgment, the Client confirms that the Laws of the Republic of South-Africa and any other applicable international laws govern this contractual undertaking and acknowledgment.
''',
                  style: TextStyle(
                    fontSize: 16.0, // Adjusted font size for readability
                    color: Colors.black54, // Softer black for body text
                    height: 1.5, // Line height for better readability
                  ),
                ),
                Text(
                  'NOTICE:',
                  style: TextStyle(
                    fontSize: 15.0, // Larger font size for heading
                    fontWeight: FontWeight.bold, // Bold for emphasis
                    color: Colors.black, // Color for better visibility
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '''
I hereby acknowledge, understand and accept the above information:
                  
I accept this Patent and copyright acknowledgment.''',
                  style: TextStyle(
                    fontSize: 16.0, // Adjusted font size for readability
                    color: Colors.black54, // Softer black for body text
                    height: 1.5, // Line height for better readability
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
