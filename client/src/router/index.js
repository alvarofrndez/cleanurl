import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from '@/stores/user'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('@/views/HomeView.vue'),
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/views/LoginView.vue')
    },
    {
      path: '/singin',
      name: 'singin',
      component: () => import('@/views/SinginView.vue')
    },
    {
      path: '/profile',
      name: 'profile',
      component: () => import('@/views/ProfileView.vue')
    },
    {
      path: '/urls',
      name: 'urls',
      component: () => import('@/views/UrlsView.vue')
    },
    {
      path: '/analytics',
      name: 'analytics',
      component: () => import('@/views/AnalyticsView.vue')
    }
  ]
})

router.beforeEach(async (to, from, next) => {
  const user_s = useUserStore()
  const is_authenticated = await user_s.getActiveUser()

  if (!is_authenticated) {
    if (to.path === '/login' || to.path === '/singin') {
      next()
    } else {
      next('/login')
    }
  } else {
    if (to.path === '/login' || to.path === '/singin') {
      next('/')
    } else {
      next()
    }
  }
})

export default router