import 'package:flutter/material.dart';

class PlanetNewsPage extends Page<void> {
  const PlanetNewsPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) => PlanetNewsRoute(this);
}

class PlanetNewsRoute extends MaterialPageRoute<void> {
  PlanetNewsRoute([PlanetNewsPage? page])
      : super(
          settings: page,
          builder: (context) => const PlanetNewsScreen(),
        );
}

class PlanetNewsScreen extends StatelessWidget {
  const PlanetNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News of our Planet')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'New EPA rules would force coal-fired \n  power plants to capture emissions\n                    or shut down',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF3F2C2C),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/factories_img.jpg',
              width: 400,
              height: 200,
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'WASHINGTON — Coal-fired power plants would be forced to capture smokestack emissions or shut down under a rule issued Thursday by the Environmental Protection Agency.\n'
                '\n'
                'New limits on greenhouse gas emissions from fossil fuel-fired electric plants are the Biden administration’s most ambitious effort yet to roll back planet-warming pollution from the power sector, the nation’s second-largest contributor to climate change. The rules are a key part of President Joe Biden’s pledge to eliminate carbon pollution from the electricity sector by 2035 and economy-wide by 2050.  \n'
                '\n'
                'The rule was among four separate measures targeting coal and natural gas plants that the EPA said would provide “regular certainty” to the power industry and encourage them to make investments to transition “to a clean energy economy.” They also include requirements to reduce toxic wastewater pollutants from coal-fired plants and to safely manage so-called coal ash in unlined storage ponds.\n'
                '\n'
                'The new rules “reduce pollution from fossil fuel-fired power plants, protect communities from pollution and improve public health — all while supporting the long-term, reliable supply of the electricity needed to power America forward,″ EPA Administrator Michael Regan told reporters at a White House briefing.\n'
                '\n'
                'The plan is likely to be challenged by industry groups and Republican-leaning states. They have repeatedly accused the Democratic administration of overreach on environmental regulations and have warned of a looming reliability crisis for the electric grid. The rules issued Thursday are among at least a half-dozen EPA rules limiting power plant emissions and wastewater pollution.\n'
                '\n'
                'Environmental groups hailed EPA’s latest action as urgently needed to protect against the devastating harms of climate change.\n'
                '\n'
                'The power plant rule marks the first time the federal government has restricted carbon dioxide emissions from existing coal-fired power plants. The rule also would force future electric plants fueled by coal or gas to control up to 90% of their carbon pollution. The new standards will avoid 1.38 billion metric tons of carbon pollution through 2047, equivalent to the annual emissions of 328 million gas cars, the EPA said, and will provide hundreds of billions of dollars in climate and health benefits, measured in fewer premature deaths, asthma cases and lost work or school days.\n'
                '\n'
                'Coal plants that plan to stay open beyond 2039 would have to cut or capture 90% of their carbon dioxide emissions by 2032, the EPA said. Plants that expect to retire by 2039 would face a less stringent standard but still would have to capture some emissions. Coal plants that are set to retire by 2032 would not be subject to the new rules.\n'
                '\n'
                'Rich Nolan, president and CEO of the National Mining Association, said that through the latest rules, “the EPA is systematically dismantling the reliability of the U.S. electric grid.’’\n'
                '\n'
                'He accused Biden, Regan and other officials of “ignoring our energy reality and forcing the closure of well-operating coal plants that repeatedly come to the rescue during times of peak demand. The repercussions of this reckless plan will be felt across the country by all Americans.”\n'
                '\n'
                'Regan denied that the rules were aimed at shutting down the coal sector, but acknowledged in proposing the power plant rule last year that, “We will see some coal retirements.”\n'
                '\n'
                'The proposal relies on technologies to limit carbon pollution that the industry itself has said are viable and available, Regan said. “Multiple power companies have indicated that (carbon capture and storage) is a viable technology for the power sector today, and they are currently pursuing those CCS projects,’’ he told reporters Wednesday.\n'
                '\n'
                'Coal provided about 16% of U.S. electricity last year, down from about 45% in 2010. Natural gas provides about 43% of U.S. electricity, with the remainder from nuclear energy and renewables such as wind, solar and hydropower.\n'
                '\n'
                'The power plant rule “completes a historic grand slam” of major actions by the Biden administration to reduce carbon pollution, said David Doniger, a climate and clean energy expert at the Natural Resources Defense Council. The first and most important action was passage of the 2022 climate law, officially known as the Inflation Reduction Act, he said, followed by separate EPA rules targeting tailpipe emissions from cars and trucks and methane emissions from oil and gas drilling.\n'
                '\n'
                'Together, the climate law and the suite of EPA rules “are the biggest reductions in carbon pollution we’ve ever made and will put the country on the pathway to zero out carbon emissions,’’ Doniger said in an interview.\n'
                '\n'
                'The nation still faces challenges in eliminating carbon from transportation, heavy industry and more, said Abigail Dillen, president of the environmental group Earthjustice, “but we can’t make progress on any of it without cleaning up the power plants.’’\n'
                '\n'
                'Jim Matheson, CEO of the National Rural Electric Cooperative Association, called the EPA rule “unlawful, unrealistic and unachievable,” adding that it faced a certain court challenge. The rule disregards the Supreme Court’s 2022 decision that limited the agency’s ability to regulate carbon pollution under the Clean Air Act, Matheson said. It also relies on technologies “that are promising, but not ready for prime time,″ he said.\n'
                '\n'
                '“This barrage of new EPA rules ignores our nation’s ongoing electric reliability challenges and is the wrong approach at a critical time for our nation’s energy future,” said Matheson, whose association represents 900 local electric cooperatives across the country.\n'
                '\n'
                'The EPA rule would not mandate use of equipment to capture and store carbon emissions — a technology that is expensive and still being developed. Instead, the agency would set caps on carbon dioxide pollution that plant operators would have to meet. Some natural gas plants could start blending gas with other fuel sources that do not emit carbon, although specific actions would be left to industry.\n'
                '\n'
                'Still, the regulation is expected to lead to greater use of carbon capture equipment. Only a handful of projects are operating in the country despite years of research.\n'
                '\n'
                'The EPA also tightened rules aimed at reducing wastewater pollution from coal-fired power plants and preventing harm from toxic pits of coal ash, a waste byproduct of burning coal.\n'
                '\n'
                'Coal ash contains cancer-causing substances like arsenic and mercury that can leach into the ground, drinking water and nearby rivers and streams, harming people and killing fish. The waste is commonly stored in ponds near power plants. EPA issued rules in 2015 to regulate active and new ponds at operating facilities, seven years after a disaster in Kingston, Tennessee that flooded two rivers with toxic waste and destroyed property.\n'
                '\n'
                'Environmental groups challenged that rule, arguing it left a large amount of coal ash waste unregulated by the federal government. The rule issued Thursday forces owners to safely close inactive coal ash ponds and clean up contamination.\n'
                '\n'
                'A separate rule will reduce toxic wastewater pollution by 660 million pounds annually, according to federal officials. It’s a reversal of the Trump administration’s push to loosen coal plant wastewater standards.\n'
                '\n'
                '“For the first time, we have seen a comprehensive set of standards that protects the surrounding waterways from the extremely nasty water pollution that comes off these coal-fired sites,” said Frank Holleman, attorney with the Southern Environmental Law Center.\n'
                '\n',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Managing Meandering Waterways \n            in a Changing World',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF408A44),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Image.asset(
              'assets/images/river.jpeg',
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Just as water moves through a river, rivers themselves move across the landscape. They carve valleys and canyons, create floodplains and deltas, and transport sediment from the uplands to the ocean.\n'
                'A new paper out of UC Santa Barbara presents an account of what drives the migration rates of meandering rivers. The two authors compiled a global dataset of these waterways, analyzing how vegetation and sediment load effect channel movement. “We find a global-scale trend between the amount of sediment that rivers carry and how quickly they’re migrating, across all variables,” said lead author Evan Greenberg, a doctoral student in the Department of Geography.  \n'
                "Their results, published in the journal Earth and Planetary Science Letters, contrast with previous work that emphasized the stabilizing effect of vegetation. In this paper, the researchers highlight how the activity of meandering rivers emerges from the interplay between sediment deposition and bank stabilization by vegetation. Some of the world's most important waterways are meandering rivers, so properly understanding their behavior is crucial to managing these natural phenomena in a changing world.",
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
