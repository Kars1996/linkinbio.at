-- CreateEnum
CREATE TYPE "Layout" AS ENUM ('Standard', 'Professional', 'Glassmorphism', 'WithCover', 'Bold', 'Modern');

-- CreateEnum
CREATE TYPE "ContentType" AS ENUM ('Playlist', 'Album', 'Track');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "last_updated_username" TIMESTAMP(3),
    "email_verified" TIMESTAMP(3),
    "password" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "bio" TEXT,
    "title" TEXT,
    "image" TEXT,
    "occupation" TEXT,
    "location" TEXT,
    "verified" BOOLEAN NOT NULL DEFAULT false,
    "premium" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "website_links" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "title" TEXT NOT NULL,
    "featured" BOOLEAN NOT NULL DEFAULT false,
    "order" INTEGER NOT NULL,
    "image_url" TEXT,
    "icon_name" TEXT,

    CONSTRAINT "website_links_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "platform_links" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "order" INTEGER NOT NULL,

    CONSTRAINT "platform_links_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_views" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "ip_address" TEXT,
    "country" TEXT,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "referrer" TEXT,

    CONSTRAINT "user_views_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "website_clicks" (
    "id" TEXT NOT NULL,
    "link_id" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ip_address" TEXT,

    CONSTRAINT "website_clicks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "platform_clicks" (
    "id" TEXT NOT NULL,
    "link_id" TEXT NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ip_address" TEXT,

    CONSTRAINT "platform_clicks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "backgrounds" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "url" TEXT,
    "color" TEXT,
    "gradient_start_color" TEXT,
    "gradient_end_color" TEXT,
    "gradient_angle" INTEGER,
    "gradient_enabled" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "backgrounds_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "buttons" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "background_color" TEXT,
    "background_blur" DOUBLE PRECISION,
    "background_opacity" DOUBLE PRECISION,
    "background_social_color" BOOLEAN,
    "shadow_solid" BOOLEAN,
    "shadow_spread_radius" INTEGER,
    "shadow_color" TEXT,
    "border_radius" INTEGER,
    "border_width" INTEGER,
    "border_color" TEXT,
    "font_color" TEXT,
    "font_shadow" BOOLEAN,
    "font_family" TEXT,
    "text_hidden" BOOLEAN,

    CONSTRAINT "buttons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profiles" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "title_font" TEXT,
    "title_color" TEXT,
    "text_color" TEXT,
    "text_font" TEXT,
    "hide_username" BOOLEAN,
    "image_radius" INTEGER,
    "layout" "Layout" DEFAULT 'Standard',

    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "icons" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "shadow" BOOLEAN,
    "style" TEXT,
    "color" TEXT,
    "size" TEXT,
    "borderRadius" TEXT,
    "position" TEXT DEFAULT 'top',

    CONSTRAINT "icons_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "visuals" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "title_effect" TEXT,
    "background_weather" TEXT,

    CONSTRAINT "visuals_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "spotify" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "content_id" TEXT NOT NULL,
    "type" "ContentType" NOT NULL,
    "dark_background" BOOLEAN NOT NULL DEFAULT false,
    "compact_layout" BOOLEAN NOT NULL DEFAULT false,
    "enabled" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "spotify_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "youtube" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "video_id" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "youtube_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "soundcloud" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "track_id" TEXT NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "soundcloud_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "website_links_user_id_order_key" ON "website_links"("user_id", "order");

-- CreateIndex
CREATE UNIQUE INDEX "platform_links_user_id_order_key" ON "platform_links"("user_id", "order");

-- CreateIndex
CREATE UNIQUE INDEX "backgrounds_user_id_key" ON "backgrounds"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "buttons_userId_key" ON "buttons"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "profiles_user_id_key" ON "profiles"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "icons_user_id_key" ON "icons"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "visuals_user_id_key" ON "visuals"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "spotify_user_id_key" ON "spotify"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "youtube_user_id_key" ON "youtube"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "soundcloud_user_id_key" ON "soundcloud"("user_id");

-- AddForeignKey
ALTER TABLE "website_links" ADD CONSTRAINT "website_links_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "platform_links" ADD CONSTRAINT "platform_links_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_views" ADD CONSTRAINT "user_views_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "website_clicks" ADD CONSTRAINT "website_clicks_link_id_fkey" FOREIGN KEY ("link_id") REFERENCES "website_links"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "platform_clicks" ADD CONSTRAINT "platform_clicks_link_id_fkey" FOREIGN KEY ("link_id") REFERENCES "platform_links"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "backgrounds" ADD CONSTRAINT "backgrounds_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "buttons" ADD CONSTRAINT "buttons_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "icons" ADD CONSTRAINT "icons_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "visuals" ADD CONSTRAINT "visuals_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spotify" ADD CONSTRAINT "spotify_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "youtube" ADD CONSTRAINT "youtube_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "soundcloud" ADD CONSTRAINT "soundcloud_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
