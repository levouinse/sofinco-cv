defmodule CvApp.CVData do
  @moduledoc """
  Static CV data storage module
  """

  def profile do
    %{
      name: "ANDI FARREL AL-FAIZY",
      title: "Full-Stack Software Engineer",
      bio: "Experienced full-stack engineer specializing in modern web technologies and scalable backend systems. Passionate about clean code, performance optimization, and delivering exceptional user experiences.",
      portfolio_url: "https://portfolio-andi.vercel.app/",
      email: "kofikampoes@gmail.com",
      location: "Remote"
    }
  end

  def experience do
    [
      %{
        title: "Full-Stack Developer",
        period: "2026 – Present",
        responsibilities: [
          "Built modern web applications using Next.js and Vue",
          "Developed backend systems with Laravel and RESTful APIs",
          "Used PostgreSQL with optimized queries for data persistence",
          "Applied TypeScript for maintainable code",
          "Automation scripting using Shell & Python",
          "Explored Rust, Go, and C++ for performance-oriented programming",
          "Managed version control with Git workflow",
          "Designed UI in Figma and implemented production-ready interfaces"
        ]
      }
    ]
  end

  def skills do
    [
      "JavaScript",
      "TypeScript",
      "Python",
      "Rust",
      "C",
      "C#",
      "C++",
      "Go",
      "Shell",
      "Vue",
      "Next.js",
      "Laravel",
      "Git",
      "PostgreSQL",
      "Figma"
    ]
  end

  def projects do
    [
      %{
        name: "Portfolio Website",
        description: "Personal portfolio showcasing projects and skills",
        url: "https://portfolio-andi.vercel.app/",
        tech: ["Vite", "React", "Tailwind CSS"]
      },
      %{
        name: "Brand Identity Design",
        description: "Modern logo and brand identity system for tech startups",
        url: "#",
        tech: ["Figma", "Adobe Illustrator", "Brand Design"],
        private: true
      },
      %{
        name: "UI/UX Dashboard",
        description: "Analytics dashboard with modern data visualization",
        url: "#",
        tech: ["Figma", "Design System", "Prototyping"],
        private: true
      }
    ]
  end

  def saas_projects do
    [
      %{
        name: "TaskFlow Pro",
        description: "AI-powered project management platform with real-time collaboration",
        url: "#",
        tech: ["Next.js", "PostgreSQL", "Stripe", "OpenAI"],
        status: "In Development",
        features: ["Real-time collaboration", "AI task automation", "Team analytics"]
      },
      %{
        name: "CloudSync",
        description: "Multi-cloud file synchronization service with end-to-end encryption",
        url: "#",
        tech: ["Go", "PostgreSQL", "AWS S3", "Redis"],
        status: "Beta",
        features: ["End-to-end encryption", "Multi-cloud support", "Version control"]
      }
    ]
  end

  def contact do
    %{
      email: "kofikampoes@gmail.com",
      github: "https://github.com/levouinse",
      linkedin: "https://linkedin.com/in/andifarrel"
    }
  end

  def stats do
    [
      %{
        label: "Projects Completed", 
        value: 50, 
        suffix: "+",
        milestones: [
          "First Website",
          "E-commerce Site",
          "Portfolio Sites",
          "Landing Pages",
          "Web Apps",
          "SaaS Projects",
          "Mobile Apps",
          "API Development",
          "Database Design",
          "Cloud Deployment",
          "Team Projects",
          "Client Projects",
          "Open Source",
          "Side Projects",
          "Current Work"
        ]
      },
      %{
        label: "Years Experience", 
        value: 3, 
        suffix: "+",
        milestones: [
          "Started Learning",
          "First HTML/CSS",
          "JavaScript Basics",
          "React Framework",
          "Backend Dev",
          "Full-Stack",
          "TypeScript",
          "Node.js",
          "Databases",
          "DevOps",
          "Team Lead",
          "Mentoring",
          "Architecture",
          "Best Practices",
          "Current Level"
        ]
      },
      %{
        label: "Technologies", 
        value: 25, 
        suffix: "+",
        milestones: [
          "HTML & CSS",
          "JavaScript",
          "React",
          "Vue.js",
          "TypeScript",
          "Node.js",
          "Express",
          "MongoDB",
          "PostgreSQL",
          "Git",
          "Docker",
          "AWS",
          "Tailwind",
          "Next.js",
          "GraphQL"
        ]
      },
      %{
        label: "Happy Clients", 
        value: 30, 
        suffix: "+",
        milestones: [
          "First Client",
          "Local Business",
          "Startup Project",
          "E-commerce",
          "Corporate Site",
          "SaaS Client",
          "International",
          "Long-term",
          "Referrals",
          "Repeat Client",
          "Agency Work",
          "Freelance",
          "Contract Work",
          "Partnerships",
          "Growing Base"
        ]
      }
    ]
  end
end
