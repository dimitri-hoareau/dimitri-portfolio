window.addEventListener('scroll', () => {
    const aboutSection = document.getElementById('about-section');
    const projectsSection = document.getElementById('projects-section');
    const navbar = document.querySelector('.navbar');
    const navLinksUl = document.querySelector('.nav-links');
    const navLinks = document.querySelectorAll('.nav-links a');

    const aboutSectionPos = aboutSection.getBoundingClientRect();
    const projectsSectionPos = projectsSection.getBoundingClientRect();


    if ((aboutSectionPos.top <= 0 && aboutSectionPos.bottom >= 47) || (projectsSectionPos.top <= 0 && projectsSectionPos.bottom >= 47)) {
        // Si l'utilisateur se trouve dans la section "about" ou "projects"
        navbar.classList.add('alt-color');
        navLinksUl.classList.add('alt-color');
        navLinks.forEach(link => link.classList.add('active-link'));
    } else {
        // Si l'utilisateur n'est dans aucune de ces sections
        navbar.classList.remove('alt-color');
        navLinksUl.classList.remove('alt-color');
        navLinks.forEach(link => link.classList.remove('active-link'));
    }
});


// Burger menu
document.querySelector('.burger').addEventListener('click', () => {
    document.querySelector('.nav-links').classList.toggle('burger-active');
    
    // Animation des lignes du burger
    document.querySelector('.burger .line1').classList.toggle('toggle');
    document.querySelector('.burger .line2').classList.toggle('toggle');
    document.querySelector('.burger .line3').classList.toggle('toggle');
});



const aboutText = document.querySelectorAll('.about-text');
const aboutImage = document.querySelectorAll('.about-image');
const skillsText = document.querySelectorAll('.skills-list-item');
const footerLeft = document.querySelectorAll('.footer-container-left');
const footerMap = document.querySelectorAll('.footer-map');


ScrollReveal().reveal('.about-section', { 
    origin: 'right',
    beforeReveal: function(domEl) {
        aboutText.forEach(text => text.classList.add('right-transition'));
        aboutImage[0].classList.add('left-transition');
    }
});

ScrollReveal().reveal('.skills-section', { 
    origin: 'right',
    beforeReveal: function(domEl) {
        skillsText.forEach(text => text.classList.add('appears'));
    }
});

ScrollReveal().reveal('.contact-section', { 
    origin: 'right',
    beforeReveal: function(domEl) {
        footerLeft[0].classList.add('left-transition');
        footerMap[0].classList.add('right-transition');
    }
});