import 'package:cyclone/pages/intro.dart';
import 'package:cyclone/widget/custom_app-bar.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class Instruction extends StatefulWidget {
  final String username;
  final VoidCallback onLogout;

  const Instruction(
      {super.key, required this.username, required this.onLogout});

  @override
  State<Instruction> createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFE7E7E7),
      appBar: CustomAppBar(
        title: loc.greeting(widget.username),
        onMenuTap: () {
          Scaffold.of(context).openEndDrawer();
        },
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pattern.png'),
            fit: BoxFit.none,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      loc.instructionTitle,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ReusableInstructionCard(
                    title: loc.instructionCardIntroductionTitle,
                    description: loc.instructionCardIntroductionDescription,
                    duration: loc.duration15min,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Intro(
                            username: widget.username,
                            onLogout: widget.onLogout,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardMainScreenTitle,
                    description: loc.instructionCardMainScreenDescription,
                    duration: loc.duration20min,
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardAddCattleTitle,
                    description: loc.instructionCardAddCattleDescription,
                    duration: loc.duration20min,
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardTechPassportTitle,
                    description: loc.instructionCardTechPassportDescription,
                    duration: loc.duration20min,
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardAnimalsTableTitle,
                    description: loc.instructionCardAnimalsTableDescription,
                    duration: loc.duration20min,
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardChatBotTitle,
                    description: loc.instructionCardChatBotDescription,
                    duration: loc.duration5min,
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardFeedWarehouseTitle,
                    description: loc.instructionCardFeedWarehouseDescription,
                    duration: loc.duration4min,
                  ),
                  const SizedBox(height: 18),
                  ReusableInstructionCard(
                    title: loc.instructionCardWeightTrackingTitle,
                    description: loc.instructionCardWeightTrackingDescription,
                    duration: loc.duration20min,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableInstructionCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final VoidCallback? onTap;

  const ReusableInstructionCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFF90010A),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        loc.instructionCardDurationLabel,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, color: Color(0xFF90010A)),
          ],
        ),
      ),
    );
  }
}
