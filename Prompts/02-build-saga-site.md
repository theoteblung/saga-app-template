# Prompt 02: Build The Saga Site

Use this after you have a site brief and your assets are in `content/static/assets/`.

```text
If required details are missing or ambiguous, ask me concise questions before making changes.

I want you to build an app landing page in this Swift Saga static site template.

Before editing:
1. Inspect `README.md`, `Package.swift`, `Sources/`, `content/`, and `content/static/`.
2. Confirm where the homepage content, Swift templates, CSS, and static assets live.
3. If my app brief, asset paths, CTA URL, or privacy/support/contact information are missing, ask me questions before making changes.

Use this site brief:

If required details are missing or ambiguous, ask me concise questions before making changes.

I am creating a promotional website for my app using this Swift Saga static site template.

First, inspect the repository so you understand the project structure. Do not edit files yet.

Help me turn the information below into a clear landing page brief. If I leave required fields blank, ask follow-up questions before writing the brief.

Required details:
- App name: Hush
- Target audience: overstimulated people who likes travelling
- Problem the app solves: overstimulated people usually listen the familiar sound like kpop or western or chinese or any song. the problem is that sound is made for enjoyment so there's high and low volume in 1 song. when the volume is lower and user can hear the noise then they tend to increase the phone volume and it's really damagin to the ear. this where our apps solve the issue, we will have pink, brown and white noise as a background noise to calm themselve down. in addition, the app also provide visual breathing exercise as a visual guide for user if they need visual misdirection when overstimulated
- Top 3 benefits:
  1. fewer step to access mufling and calming sound compared to other apps
  2. customizeable each sound depends on user preference
  3. customizeable breathing technique and background sound that user can select
- Primary call to action:
  - Label:
  - URL:
- Asset folder path in this repo:
  - content/static/assets/
  - app-icon.png is the app icon
  - main-screen.png is where the user will play and select the background pink white and brown noise
  - breathing-guide-screen is where the breathing guide will show when the user want visual guide to calm down
  - onboarding screen is where the app will showing at the first time, it will only showing one to briefly introduce the apps

Strongly recommended details:
- App icon filename: 
- Screenshot filenames:
- App Store or TestFlight link: https://testflight.apple.com/join/gzQWREQf
- Privacy policy link or privacy notes:
- Support/contact link or email:
- Short FAQ:
  - Question:
  - Answer:
- Desired visual direction:
  - Examples: clean and professional, zen, simple, brown, pink, white, slow.

Optional details:
- Testimonials or quotes:
- Newsletter or waitlist link:
- Social links:
- Press or launch notes:
- Any words, claims, or visual styles to avoid:

Analyze the App XCode Project to fully understand the app capabilities unique selling proposition and colors used in the app to match the color pallet on the website:
/Users/username/Documents/code/exampleproject

App Color Pallet contained in image: content/static/assets/filename.svg

- Any words, claims, or visual styles to avoid: 
Don't bring in a lot of clichés, use copy that stands out from other apps



Analyze the App XCode Project to fully understand the app capabilities unique selling proposition and colors used in the app to match the color pallet on the website:
Example: /Users/theoteblung/Documents/ios projects/ada ios project/ada_ch3_challenge

App Color Pallet contained in: Example: content/static/assets/appcolors.svg

- Any words, claims, or visual styles to avoid: 
Don't bring in a lot of clichés, use copy that stands out from other apps

Create a concise website brief with:
- One-sentence app positioning using your copywriting skill.
- Recommended headline and subheadline.
- Suggested page sections.
- A list of assets to use.
- Any missing items I should provide before implementation.

Implementation requirements:
- Build a polished single-page app website.
- Keep editable marketing copy in Markdown where practical.
- Use Swift templates only for structure, reusable layout, metadata, and components that are awkward in Markdown.
- Use assets from `content/static/assets/`.
- Reference assets with public paths like `/static/assets/screenshot-home.png`.
- Include these sections when enough information is available:
  - Hero with app name, headline, subheadline, primary CTA, and app visual.
  - Benefits or features.
  - Screenshots or product preview.
  - App Store or TestFlight CTA.
  - FAQ.
  - Privacy/support/contact links.
- Include SEO title, meta description, and social sharing metadata if the template supports it. If it does not support these yet, ask before adding that capability.
- Make the page responsive for mobile and desktop.
- Avoid placeholder text unless you clearly mark it as TODO.
- Do not edit generated files in `deploy/` directly.

Style requirements:
- Use a visual direction that fits the app and audience.
- Avoid generic AI-looking purple gradient landing pages unless my brief explicitly asks for that.
- Keep text readable and buttons easy to tap on mobile.
- Do not use assets outside the repository unless I approve them.

Be sure to use skills as necessary for the following
- Frontend Design Skill
- Copywriting Skill
- Saga site building skill

After editing:
- Tell me which files changed.
- Tell me what command to run to preview the site.
- Tell me what to check in the browser.
```
