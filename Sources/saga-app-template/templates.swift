import Foundation
import HTML
import Saga
import SagaPathKit
import SagaSwimRenderer

let testFlightURL = "https://testflight.apple.com/join/gzQWREQf"
let supportEmail = "christofer.theodore@gmail.com"

// ---------------------------------------------------------------------------
// Shared layout for generic pages (articles, privacy, etc.)
// ---------------------------------------------------------------------------

func baseHtml(title pageTitle: String, @NodeBuilder children: () -> NodeConvertible) -> Node {
  html(lang: "en-US") {
    head {
      meta(charset: "utf-8")
      meta(content: "width=device-width, initial-scale=1", name: "viewport")
      title { pageTitle }
      link(href: Saga.hashed("/static/style.css"), rel: "stylesheet")
    }
    body {
      header(class: "site-header") {
        div(class: "site-nav") {
          a(class: "site-title", href: "/") { SiteMetadata.name }
          a(class: "cta-btn", href: testFlightURL) { "Try Hush on TestFlight" }
        }
      }
      main {
        children()
      }
      footer {
        div(class: "footer-inner") {
          span { "© 2026 Hush" }
          div(class: "footer-links") {
            a(href: "mailto:\(supportEmail)") { "Support" }
          }
        }
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Landing page layout — full SEO/OG head, no inner width constraint on body
// ---------------------------------------------------------------------------

let appDescription = "Customizable pink, white, and brown noise — plus visual breathing guides. Built for overstimulated travelers."

func landingHtml(@NodeBuilder children: () -> NodeConvertible) -> Node {
  html(lang: "en-US") {
    head {
      meta(charset: "utf-8")
      meta(content: "width=device-width, initial-scale=1", name: "viewport")
      title { "Hush — Find your quiet." }
      meta(content: appDescription, name: "description")
      // Open Graph — edit appDescription above to change the preview text
      Node.raw("<meta property=\"og:title\" content=\"Hush — Find your quiet.\">")
      Node.raw("<meta property=\"og:description\" content=\"\(appDescription)\">")
      Node.raw("<meta property=\"og:type\" content=\"website\">")
      Node.raw("<meta property=\"og:image\" content=\"/static/assets/onboarding-screen.png\">")
      // Twitter Card
      Node.raw("<meta name=\"twitter:card\" content=\"summary_large_image\">")
      Node.raw("<meta name=\"twitter:title\" content=\"Hush — Find your quiet.\">")
      Node.raw("<meta name=\"twitter:description\" content=\"\(appDescription)\">")
      link(href: Saga.hashed("/static/style.css"), rel: "stylesheet")
    }
    body {
      header(class: "site-header") {
        div(class: "site-nav") {
          a(class: "site-title", href: "/") { SiteMetadata.name }
          a(class: "cta-btn", href: testFlightURL) { "Try Hush on TestFlight" }
        }
      }
      main {
        children()
      }
      footer {
        div(class: "footer-inner") {
          span { "© 2026 Hush" }
          div(class: "footer-links") {
            a(href: "mailto:\(supportEmail)") { "Support" }
          }
        }
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Landing page sections
// Edit marketing copy:
//   • Hero headline/subheadline  → renderHomePage() below (search COPY:)
//   • Problem paragraph          → content/index.md  (Markdown body)
//   • Feature card titles/body   → renderHomePage() below (search COPY:)
//   • CTA banner text            → renderHomePage() below (search COPY:)
// ---------------------------------------------------------------------------

func renderHomePage(context: ItemRenderingContext<EmptyMetadata>) -> Node {
  landingHtml {
    // --- Hero ---
    div(class: "hero") {
      div(class: "hero-content") {
        img(alt: "Hush app icon", class: "app-icon", src: "/static/assets/app-icon.png")
        // COPY: headline
        h1(class: "hero-headline") { "Find your quiet." }
        // COPY: subheadline
        p(class: "hero-sub") {
          "Customizable pink, white, and brown noise — plus visual breathing guides. Built for when the world is too loud and music makes it worse."
        }
        a(class: "cta-btn", href: testFlightURL) { "Try Hush on TestFlight" }
      }
      div(class: "hero-screenshot") {
        img(alt: "Hush noise player", class: "phone-frame", src: "/static/assets/main-screen.png")
      }
    }

    // --- Problem — prose lives in content/index.md ---
    div(class: "problem-section") {
      div(class: "problem-inner") {
        Node.raw(context.item.body)
      }
    }

    // --- Features ---
    div(class: "features-section", id: "features") {
      div(class: "section-inner") {
        div(class: "features-grid") {
          // COPY: feature cards
          div(class: "feature-card") {
            h3 { "Fewer steps to quiet" }
            p { "Open. Tap once. Done. No playlists, no searching, no ads between you and calm." }
          }
          div(class: "feature-card") {
            h3 { "Your noise, your mix" }
            p { "Pink, white, or brown — each with its own character. Dial in the frequency and volume that actually works for you." }
          }
          div(class: "feature-card") {
            h3 { "See your breath" }
            p { "When sound alone isn't enough, the visual guide gives your eyes something to follow while your nervous system resets." }
          }
        }
      }
    }

    // --- Screenshots ---
    div(class: "screenshots-section") {
      div(class: "section-inner") {
        div(class: "screenshots-grid") {
          div(class: "screenshot-item") {
            img(alt: "Pick your noise", class: "screenshot-img", src: "/static/assets/main-screen.png")
            p(class: "screenshot-label") { "Pick your noise" }
          }
          div(class: "screenshot-item") {
            img(alt: "Visual breathing guide", class: "screenshot-img", src: "/static/assets/breathing-guide-screen.png")
            p(class: "screenshot-label") { "Visual breathing guide" }
          }
          div(class: "screenshot-item") {
            img(alt: "Calm from the first open", class: "screenshot-img", src: "/static/assets/onboarding-screen.png")
            p(class: "screenshot-label") { "Calm from the first open" }
          }
        }
      }
    }

    // --- CTA Banner ---
    div(class: "cta-section") {
      div(class: "cta-inner") {
        // COPY: CTA banner
        h2 { "Hush is in beta. Try it free." }
        p(class: "cta-desc") { "Available now on TestFlight. No commitment, no cost." }
        a(class: "cta-btn", href: testFlightURL) { "Try Hush on TestFlight" }
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Article renderers
// ---------------------------------------------------------------------------

func renderArticle(context: ItemRenderingContext<ArticleMetadata>) -> Node {
  baseHtml(title: context.item.title) {
    article {
      h1 { context.item.title }
      ul(class: "tags") {
        context.item.metadata.tags.map { tag in
          li {
            a(href: "/articles/tag/\(tag.slugified)/") { tag }
          }
        }
      }
      Node.raw(context.item.body)
    }
  }
}

func renderArticles(context: ItemsRenderingContext<ArticleMetadata>) -> Node {
  baseHtml(title: "Articles") {
    div(class: "page") {
      h1 { "Articles" }
      context.items.map { article in
        div(class: "article-card") {
          h2 {
            a(href: article.url) { article.title }
          }
          if let summary = article.metadata.summary {
            p { summary }
          }
        }
      }
    }
  }
}

func renderTag<T>(context: PartitionedRenderingContext<T, ArticleMetadata>) -> Node {
  baseHtml(title: "Articles tagged \(context.key)") {
    div(class: "page") {
      h1 { "Articles tagged \(context.key)" }
      context.items.map { article in
        div(class: "article-card") {
          h2 {
            a(href: article.url) { article.title }
          }
        }
      }
    }
  }
}

// ---------------------------------------------------------------------------
// Generic page renderer — routes "/" to the landing page
// ---------------------------------------------------------------------------

func renderPage(context: ItemRenderingContext<EmptyMetadata>) -> Node {
  if context.item.url == "/" {
    return renderHomePage(context: context)
  }
  return baseHtml(title: context.item.title) {
    div(class: "page") {
      h1 { context.item.title }
      Node.raw(context.item.body)
    }
  }
}
